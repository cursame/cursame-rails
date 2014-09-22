class NetworkSetting < ActiveRecord::Base
  belongs_to :network
  validates_associated :network
  validates :property, presence: true
  validates :value, presence: true

  PROPERTY = { hide_course_publications_in_main_wall: 'hide_course_publications_in_main_wall' }

end
