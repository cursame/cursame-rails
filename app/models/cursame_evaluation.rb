class CursameEvaluation < ActiveRecord::Base
  belongs_to :course
  validates :course, presence: true

  validates :delivery_percentages, :discussion_percentages, :survey_percentages, :cursame_percentages, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
