class UserLanguage < ActiveRecord::Base
  attr_accessible :user_id, :language_id
  belongs_to :user
  belongs_to :language

  validates :user_id, uniqueness: true
end
