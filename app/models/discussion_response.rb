class DiscussionResponse < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_one :grade, as: :gradable, dependent: :destroy
  attr_accessible :discussion_id, :user_id

  def messages
  	
  end

end
