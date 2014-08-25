class EvaluationCriterium < ActiveRecord::Base
	belongs_to :evaluable, polymorphic: true
	has_many :members_in_course_criteria, dependent: :destroy
	validates :name, presence: true

	after_update do
		if self.evaluable_type == 'Course' && !self.evaluable.active_status?
			self.members_in_course_criteria.each { |course_criteria| course_criteria.update_grade }
		end
	end

end
