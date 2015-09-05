class UserLanguage < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  validates :user_id, uniqueness: true
end
