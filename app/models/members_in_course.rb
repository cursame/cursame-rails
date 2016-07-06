# -*-   coding: utf-8 -*-
class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  belongs_to :network

  has_many :response_to_the_evaluations, as: :feedbackable, dependent: :destroy
  has_many :members_in_course_criteria, dependent: :destroy
  has_one :grade, as: :gradable, dependent: :destroy

  attr_accessible :grade_attributes, :user_id, :course_id, :accepted, :members_in_course_criteria_attributes, :owner, :network_id, :user, :course
  accepts_nested_attributes_for :grade
  accepts_nested_attributes_for :members_in_course_criteria

  before_destroy do
    course_channel = Channel.find_by_channel_name("/messages/course_channel_#{course.id}")
    if not(course_channel.nil?)
      audiences = course_channel.audiences
      index = audiences.index{|x| x.user_id == user_id}

      if not(index.nil?)
        audiences[index].destroy
      end
    end
  end

  # Returns an array of hashes, containing all surveys of the course and the surveys responses.
  # ie: [{ survey: ..., survey_response: ... }]
  def surveys_evaluation
    final_grade_surveys = course.surveys.keep_if { |survey| survey.final_grade }
    final_grade_surveys.map do |survey|
      { survey: survey, user_survey: UserSurvey.find_by_survey_id_and_user_id(survey.id, self.user.id) }
    end
  end

  # Returns an array of hashes, containing all deliveries of the course and the assignments.
  # ie: [{ delivery: ..., assignment: ... }]
  def deliveries_evaluation
    final_grade_deliveries = course.deliveries.keep_if { |delivery| delivery.final_grade }
    final_grade_deliveries.map do |delivery|
      { delivery: delivery, assignment: Assignment.find_by_delivery_id_and_user_id(delivery.id, self.user.id) }
    end
  end

  # Returns an array of hashes, containing all disucussions of the course and the discussion responses.
  # ie: [{ discussion: ..., discussion_response: ... }]
  def discussions_evaluation
    self.course.discussions.where(evaluable: true).map do |discussion|
      { discussion: discussion, discussion_response: DiscussionResponse.find_by_discussion_id_and_user_id(discussion.id, self.user.id) }
    end
  end

  # Returns the array of the course grades
  def course_scores
    surveys_scores + discussions_scores + deliveries_scores
  end

  # Returns the array of the surveys scores
  def surveys_scores
    surveys_evaluation.map { |evaluation| (evaluation[:user_survey].nil? || evaluation[:user_survey].grade.nil?) ? 0 : evaluation[:user_survey].grade.score }
  end

  # Returns the array of discussions scores
  def discussions_scores
    discussions_evaluation.map { |evaluation| (evaluation[:discussion_response].nil? || evaluation[:discussion_response].grade.nil?) ? 0 : evaluation[:discussion_response].grade.score }
  end

  # Returns the array of the deliveries scores
  def deliveries_scores
    deliveries_evaluation.map { |evaluation| (evaluation[:assignment].nil? || evaluation[:assignment].grade.nil?) ? 0 : evaluation[:assignment].grade.score }
  end

  # Returns the average grade of the course.
  def course_average_old
    (course_scores.empty?) ? 10 : course_scores.inject { |sum, element| sum + element }.to_f / course_scores.size
  end

  # Returns the average grade of the course with evaluation criteria deliveries, surveys discussions cursame.
  def course_average
    criterium_deliveries = self.course.evaluation_criteria.find_by_name('cursame_deliveries')
    deliveries_percentage = criterium_deliveries.nil? ? 0 : criterium_deliveries.evaluation_percentage.to_f

    criterium_surveys = self.course.evaluation_criteria.find_by_name('cursame_surveys')
    surveys_percentage = criterium_surveys.nil? ? 0 : criterium_surveys.evaluation_percentage.to_f

    criterium_discussions = self.course.evaluation_criteria.find_by_name('cursame_discussions')
    discussions_percentage = criterium_discussions.nil? ? 0 : criterium_discussions.evaluation_percentage.to_f


    # (course_scores.empty?) ? 10 : course_scores.inject { |sum, element| sum + element }.to_f / course_scores.size
    result = (surveys_average * surveys_percentage/100) + (deliveries_average * deliveries_percentage/100) + (discussions_average * discussions_percentage/100)
  end

  # Returns the average grade for surveys.
  def surveys_average
    (surveys_scores.empty?) ? 0 : surveys_scores.inject { |sum, element| sum + element }.to_f / surveys_scores.size
  end

  # Returns the average grade for deliveries.
  def deliveries_average
    (deliveries_scores.empty?) ? 0 : deliveries_scores.inject { |sum, element| sum + element }.to_f / deliveries_scores.size
  end

  # Returns the average grade for discussions.
  def discussions_average
    (discussions_scores.empty?) ? 0 : discussions_scores.inject { |sum, element| sum + element }.to_f / discussions_scores.size
  end

  # Returns the number of Assigments.
  def count_deliveries_responses
    deliveries_evaluation.inject(0) { |count, element| count + ( element[:assignment].nil? ? 0 : 1 ) }
  end

  # Returns the number of DiscussionResponses.
  def count_discussions_responses
    discussions_evaluation.inject(0) { |count, element| count + ( element[:discussion_response].nil? ? 0 : 1 ) }
  end

  # Returns the number of UserSurveys.
  def count_surveys_responses
    surveys_evaluation.inject(0) { |count, element| count + ( element[:user_survey].nil? ? 0 : 1 ) }
  end

  # Returns true if the MemberInCourse can be evaluated.
  def has_evaluation?
    self.accepted? && !self.owner
  end

  def cursame_deliveries_percentage
    cursame_deliveries_criterium = self.course.evaluation_criteria.find_by_name('cursame_deliveries')
    cursame_deliveries_criterium.nil? ? 0 : cursame_deliveries_criterium.evaluation_percentage
  end

  def cursame_surveys_percentage
    cursame_surveys_criterium = self.course.evaluation_criteria.find_by_name('cursame_surveys')
    cursame_surveys_criterium.nil? ? 0 : cursame_surveys_criterium.evaluation_percentage
  end

  def cursame_discussions_percentage
    cursame_discussions_criterium = self.course.evaluation_criteria.find_by_name('cursame_discussions')
    cursame_discussions_criterium.nil? ? 0 : cursame_discussions_criterium.evaluation_percentage
  end

  def import(path,network,course,user_admin)
    arrayErrores = Array.new
    count = 1

    CSV.foreach(path, headers: true) do |row|
      if !row["id"].nil? then
        member_in_course = MembersInCourse.find_by_id(row["id"]) || MembersInCourse.new
      else
        member_in_course = MembersInCourse.new
      end

      errors = false

      hash = row.to_hash
      email = hash.delete("Email")

      user = User.find_by_email(email)

      if !email.nil? then
        if user.nil?
          arrayErrores.push({:line => count, :message => "El correo no pertenece a algun usuario activo."})
          errors = true
        end
      else
        arrayErrores.push({:line => count, :message => "No se especifico un correo"})
        errors = true
      end

      owner = hash.delete("Propietario")

      owner.downcase! if !owner.nil?
      owner.strip! if !owner.nil?

      if owner != "0" and owner != "1" then
        arrayErrores.push({:line => count,:message => "No se especifico si es propietario o no del curso" })
        errors = true
      elsif owner == "0" then
        owner = true
      else
        owner = nil
      end

      if !errors then
        begin
          member_db = MembersInCourse.find_by_user_id_and_course_id_and_network_id(user.id,course.id,network.id)
          member_in_course = member_db if !member_db.nil?
          member_in_course.user_id = user.id
          member_in_course.course_id = course.id
          member_in_course.accepted = true
          member_in_course.owner = owner
          member_in_course.network_id = network.id
          member_in_course.active_status = true
          member_in_course.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.error.each do |error|
            arrayErrores.push({:line => count, :message => "Falta especificar: " + error.to_s })
          end
        end
      end
    end

    begin
      mail = Notifier.send_import_members(user_admin,arrayErrores,course)
      mail.deliver
    rescue
    end
  end

  handle_asynchronously :import, :priority => 20, :run_at => Proc.new{Time.zone.now}

  def destroy_grades
    self.members_in_course_criteria.each { |criteria|criteria.destroy }
    self.grade.destroy unless self.grade.nil?
  end

  def evaluate!
    if self.grade.blank?
      self.grade = Grade.new gradable: self, score: course_final_score, user: self.user
      self.save!
    else
      self.grade.update_attributes(:gradable => self, :score => course_final_score, :user => self.user)
    end
  end

  private
  # Returns the final score of the course for this user.
  def course_final_score
    if self.course.cursame_criteria
      criteria_final_score
    else
      cursame_final_score + criteria_final_score
    end
  end

  # Returns the cursame final score.
  def cursame_final_score
    self.course_average_old * (self.members_in_course_criteria.inject(100) { |score, criteria| score - criteria.evaluation_criterium.evaluation_percentage } / 100.0)
  end

  # Returns the criteria final score.
  def criteria_final_score
    self.members_in_course_criteria.inject(0) { |score, criteria| score + criteria.grade.score * (criteria.evaluation_criterium.evaluation_percentage/100.0) }
  end

end
