class Course < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  has_many :members_in_courses, :dependent => :destroy
#has_many :definer_users
 # has_many :users, :through => :definer_users  
  has_many :deliveries_courses
  has_many :deliveries, :through => :deliveries_courses
  has_many :surveys
  has_many :assignments
  has_many :surveyings
  has_many :surveys, :through => :surveyings
  has_many :response_to_the_evaluations
  has_many :discussions_coursess
  has_many :discussions, :through => :discussions_coursess
  belongs_to :network
  has_many :comments
  has_many :walls
  
  #se declara la presencia de los campos que deben ser llenados en el modelo de curso
  
  validates_presence_of :title
  validates_presence_of :silabus
  #validates_presence_of :init_date
  #validates_presence_of :finish_date
  #validates_presence_of :survey_param_evaluation
  #validates_presence_of :delivery_param_evaluation
  validates_presence_of :network_id
  
  
  
  
  
  #comentarios para los cursos
  acts_as_commentable 

  #avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  
  after_create do
    if self.public_status == 'public'
      User.all.each do |u|
        Notification.create :user => u, :notificator => self, :kind => 'new_public_course_on_network'          
        Wall.create :user => u, :publication => self, :network => self.network
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
  
  def pendings
    count = 0
    self.members_in_courses.each do |member|
      if !member.accepted then
        count += 1
      end
    end
    return count
  end

  def user
    self.users 
  end
  def state
    @state = "published"
  end
  
end
