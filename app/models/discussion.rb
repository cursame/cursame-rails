class Discussion < ActiveRecord::Base 
   has_many :discussions_courses
   has_many :courses, :through => :discussions_courses
   belongs_to :network
   has_many :comments
   belongs_to :user
  
  
  #comentarios para las discusiones
  acts_as_commentable

  after_create do
  	#con esto se guarda en wall
    Wall.create :user => self.user, :publication => self
  end

end
