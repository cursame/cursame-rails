class Grade < ActiveRecord::Base
	attr_accessible :user_id, :score, :gradable, :user, :feedback
	belongs_to :gradable, polymorphic: true
	belongs_to :user

	validates_associated :user
	validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  after_update do
    if self.gradable_type == 'MembersInCourseCriterium'
      self.gradable.evaluate_member!
    end
  end

end
