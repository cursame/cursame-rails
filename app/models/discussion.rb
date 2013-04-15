class Discussion < ActiveRecord::Base 
   has_many :discussions_coursess
   has_many :courses, :through => :discussions_coursess
   has_many :activities, as: :activitye
   
   belongs_to :network
   belongs_to :user
  
  
  #comentarios para las discusiones
  acts_as_commentable
  #para los likes
  acts_as_votable

  after_create do
  	#con esto se guarda en wall
    if self.courses.count == 0 # si es publica @todo aqui hay volverla publica
      Wall.create( :publication => self, :network => self.network, :public => true)
    else
      users =[]
      self.courses.each do |c|
        users+= c.users
      end
      Wall.create :users => users, :publication => self, :network => self.network, :courses => self.courses
    end
  end
  
  def state
    @state = "published"
  end
end
