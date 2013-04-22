class Assignment < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
  belongs_to :course
  has_many :assignment_assets, :dependent => :destroy
  has_many :assets, :through => :assignment_assets
  has_many :response_to_the_evaluations, :dependent => :destroy
  has_many :activities, as: :activitye, :dependent => :destroy


  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations

  after_create do
    # Envia correo a todos los maestros de los cursos a los cuales pertenece
    # el delivery asociado al assignment.
    self.delivery.courses.each do
      |course|
      teachers = course.members_in_courses.keep_if {
        |member|
        member.owner == true
      }
      teachers.each do
        |teacher|
        teacher.user.settings_teacher.increment_deliveries if !teacher.user.settings_teacher.nil?
      end
    end
  end
end
