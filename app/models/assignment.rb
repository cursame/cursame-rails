class Assignment < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
  belongs_to :course
  has_many :assignment_assets
  has_many :assets, :through => :assignment_assets
  has_many :response_to_the_evaluations, :dependent => :destroy
  has_many :activities, as: :activitye


  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations

=begin
  after_create do
    self.delivery.courses.each do
      |course|
      teachers = course.members_in_courses.keep_if {
        |member|
        member.owner == true
      }

      teachers.each do
        |teacher|
        teacher.user.settings_teacher.increment_deliveries
      end
    end
  end
=end
end
