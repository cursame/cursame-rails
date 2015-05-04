class TimeTryingSurvey < ActiveRecord::Base
  attr_accessible :open_at, :send_at, :survey_id, :user_id

  belongs_to :user
  belongs_to :survey

end
