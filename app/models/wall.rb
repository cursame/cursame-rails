class Wall < ActiveRecord::Base
	belongs_to :publication, :polymorphic => true, :dependent => :destroy
	belongs_to :user
	belongs_to :network
	belongs_to :course 
	acts_as_commentable
  #para los likes
  acts_as_votable
	def self.search(search)
		if search
			where('publication_type LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end
