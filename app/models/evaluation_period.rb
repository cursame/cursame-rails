class EvaluationPeriod < ActiveRecord::Base
  attr_accessible :course_id, :name, :order, :short_name, :deliveries,
                  :surveys, :discussions, :evaluation_criteria_attributes

  belongs_to :course
  validates_associated :course

  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :discussions, dependent: :destroy

  accepts_nested_attributes_for :evaluation_criteria, allow_destroy: true

  def new_evaluation_criteria
    if evaluation_criteria.blank?
      EvaluationCriterium.create(name: 'cursame_deliveries', evaluable: self, evaluation_percentage: 0)
      EvaluationCriterium.create(name: 'cursame_surveys', evaluable: self, evaluation_percentage: 0)
      EvaluationCriterium.create(name: 'cursame_discussions', evaluable: self, evaluation_percentage: 0)
    end
  end

  def deliveries_percentage
    evaluation_criteria.find_by_name('cursame_deliveries').evaluation_percentage
  end

  def surveys_percentage
    evaluation_criteria.find_by_name('cursame_surveys').evaluation_percentage
  end

  def discussions_percentage
    evaluation_criteria.find_by_name('cursame_discussions').evaluation_percentage
  end

  def deliveries_evaluation(user_id)
    deliveries.map do |delivery|
      { delivery:   delivery,
        assignment: Assignment.find_by_delivery_id_and_user_id(delivery.id, user_id)
      }
    end
  end

  def deliveries_scores(user_id)
    deliveries_evaluation(user_id).map do |evaluation|
      if evaluation[:assignment].nil? || evaluation[:assignment].grade.nil?
        0
      else
        evaluation[:assignment].grade.score
      end
    end
  end

  def deliveries_average(user_id)
    scores = deliveries_scores(user_id)
    average(scores)
  end

  def surveys_evaluation(user_id)
    surveys.map do |survey|
      { survey:      survey,
        user_survey: UserSurvey.find_by_survey_id_and_user_id(survey.id, user_id)
      }
    end
  end

  def surveys_scores(user_id)
    surveys_evaluation(user_id).map do |evaluation|
      if evaluation[:user_survey].nil? || evaluation[:user_survey].grade.nil?
        0
      else
        evaluation[:user_survey].grade.score
      end
    end
  end

  def surveys_average(user_id)
    scores = surveys_scores(user_id)
    average(scores)
  end

  def discussions_evaluation(user_id)
    discussions.where(evaluable: true).map do |discussion|
      { discussion:          discussion,
        discussion_response: DiscussionResponse.find_by_discussion_id_and_user_id(discussion.id, user_id)
      }
    end
  end

  def discussions_scores(user_id)
    discussions_evaluation(user_id).map do |evaluation|
      if evaluation[:discussion_response].nil? || evaluation[:discussion_response].grade.nil?
        0
      else
        evaluation[:discussion_response].grade.score
      end
    end
  end

  def discussions_average(user_id)
    scores = discussions_scores(user_id)
    average(scores)
  end

  def average(scores)
    if scores.empty?
      0
    else
      scores.inject { |sum, element| sum + element }.to_f / scores.size
    end
  end
end
