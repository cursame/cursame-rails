class Discussion < ActiveRecord::Base
   has_many :discussions_coursess, :dependent => :destroy
   has_many :courses, :through => :discussions_coursess
   has_many :activities, as: :activitye#, :dependent => :destroy

   belongs_to :network
   belongs_to :user

  validate :max_courses


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

  def max_courses
    errors.add(:courses, "Solamente puede tener un curso asociado al delivery") if courses.length >= 2
  end
end
