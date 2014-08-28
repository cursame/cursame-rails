class EvaluationCriterium < ActiveRecord::Base
	belongs_to :evaluable, polymorphic: true
	has_many :members_in_course_criteria, dependent: :destroy
	validates :name, presence: true

  after_create do
    puts "EvaluationCriterium : after_create"
    self.evaluable.members_in_courses.each { |member| member.evaluate! } if self.evaluable_type == 'Course'
  end

	after_update do
    puts "EvaluationCriterium : after_update"
		self.evaluable.members_in_courses.each { |member| member.evaluate! } if self.evaluable_type == 'Course'
	end

end
