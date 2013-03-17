class Discussion < ActiveRecord::Base 
   has_many :discussions_coursess
   has_many :courses, :through => :discussions_coursess
   
   belongs_to :network
   belongs_to :user
  
  
  #comentarios para las discusiones
  acts_as_commentable

  after_create do
  	#con esto se guarda en wall
    Wall.create :user => self.user, :publication => self, :network => self.network
  end
  
  def state
    @state = "published"
  end
end
