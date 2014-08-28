class EvaluationCriterium < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
  has_many :members_in_course_criteria, dependent: :destroy
  validates :name, presence: true

  after_create do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
  end

  after_destroy do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
  end

  after_update do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
  end

end
