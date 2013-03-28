class Discussion < ActiveRecord::Base 
   has_many :discussions_coursess
   has_many :courses, :through => :discussions_coursess
   
   belongs_to :network
   belongs_to :user
  
  
  #comentarios para las discusiones
  acts_as_commentable
  #para los likes
  acts_as_votable

  after_create do
  	#con esto se guarda en wall
    self.courses.each do |course|
      Wall.create :user => self.user, :publication => self, :network => self.network, :course_id => course.id
    end
    if self.courses.count == 0 # si es publica
      Wall.create :user => self.user, :publication => self, :network => self.network
    end   
  end
  
  def state
    @state = "published"
  end
end
