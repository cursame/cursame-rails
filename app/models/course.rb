class Course < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  has_many :members_in_courses
#has_many :definer_users
 # has_many :users, :through => :definer_users  
  has_many :deliveries_courses
  has_many :deliveries, :through => :deliveries_courses
  has_many :surveys
  has_many :assignments
  has_many :surveyings
  has_many :surveys, :through => :surveyings
  has_many :response_to_the_evaluations
  has_many :discussions_courses
  has_many :discussions, :through => :discussions_courses
  belongs_to :network
  has_many :comments
  
  
  #comentarios para las redes
  acts_as_commentable 

  
  after_create do
    if self.public_status == 'public'
      self.members_in_courses.each do |u|
        user = User.find_by_id(u.user_id)
        if u.owner != true
          Notification.create :user => user, :notificator => self, :kind => 'new_public_course_on_network'          
        end
        Wall.create :user => user, :publication => self
      end
    end  
  end

  def self.search(search)
    if search
      @searcher = find(:all, :conditions => ['title LIKE ?', "%#{search}%"])        
    else
      find(:all, :order => :title)
    end
  end
  
  ####es necesario sustituir el tipo de lectura de la relación manualmente #####
  ########## se crea el campo users en el modelo para poder generar la lectura correcta dentro de las relaciones ######
  def razon_users
      @members = self.members_in_courses
  end
  
  def users_invoque
     razon_users.select("user_id, course_id")
  end
  
  def users
      @ids = []
    users_invoque.each do |invoque|
      @ids.push(invoque.user_id)     
    end
      @users = User.find(@ids)
  end
  
  

  def user
    self.users 
  end
  
end
