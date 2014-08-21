# -*- coding: utf-8 -*-
class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  has_many :response_to_the_evaluations, as: :feedbackable, dependent: :destroy
  has_many :members_in_course_criteria
  has_one :grade, as: :gradable, dependent: :destroy

  attr_accessible :grade_attributes, :response_to_the_evaluations_attributes

  accepts_nested_attributes_for :response_to_the_evaluations
  accepts_nested_attributes_for :grade

  after_create do
    if (!self.owner) then
      if(!self.accepted) then
        Notification.create(:notificator => self, :users => self.course.owners, :kind => "user_request_membership_in_course", :active => true)
      end
    end
  end

  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?) then
      if (!accepted[0] and accepted[1]) then
        begin
          mail = Notifier.accepted_message(self,self.course)
          mail.deliver
        rescue
        end
        Notification.create(:users => [self.user], :notificator => self.course, :kind => 'user_accepted_in_course')
      end
    end


    if not(accepted.nil?)

      course_channel = Channel.find_by_channel_name("/messages/course_channel_#{course.id}")
      if not(course_channel.nil?)
        audiences = course_channel.audiences
        if (accepted)
          index = audiences.index{|x| x.user_id == user_id}
          if (index.nil?)
            Audience.create(user_id: user_id, channel_id: course_channel.id)
          end
        else
          if not(index.nil?)
            audiences[index].destroy
          end
        end
      end
    end
  end

  before_destroy do
    notifications = Notification.where(:notificator_id => self.course_id,:notificator_type => "Course",:kind => 'user_accepted_in_course')

    notifications.each do
      |notification|
      if notification.users.include?(self.user) then
        notification.destroy
      end
    end

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
    self.course.surveys.map do |survey| 
      { survey: survey, user_survey: UserSurvey.find_by_survey_id_and_user_id(survey.id, self.user.id) }
    end
  end

  # Returns an array of hashes, containing all deliveries of the course and the assignments.
  # ie: [{ delivery: ..., assignment: ... }]
  def deliveries_evaluation
    self.course.deliveries.map do |delivery| 
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
  def course_average
    (course_scores.empty?) ? 10 : course_scores.inject { |sum, element| sum + element }.to_f / course_scores.size
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

  def has_evaluation?
    self.accepted? && !self.owner
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

  def title
    return ""
  end

end
