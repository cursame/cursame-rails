class Wall < ActiveRecord::Base
	belongs_to :publication, :polymorphic => true, :dependent => :destroy
	belongs_to :user
	belongs_to :network
	belongs_to :course 
	acts_as_commentable
  #para los likes
  acts_as_votable
	def self.search(search,id)
		if search			
			query = 'publication_type LIKE "%'+search+'%"'
			query += id ?  ' and publication_id = '+id : ' '
			where(query)
		else
			scoped
		end
	end
end
