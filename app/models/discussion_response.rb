class DiscussionResponse < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_one :grade, as: :gradable, dependent: :destroy
  has_many :response_to_the_evaluations, as: :feedbackable, dependent: :destroy
  attr_accessible :discussion_id, :user_id

  accepts_nested_attributes_for :response_to_the_evaluations
  accepts_nested_attributes_for :grade
end
