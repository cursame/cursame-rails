class Course < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  has_many :members_in_courses, :dependent => :destroy
  has_many :definer_users, :dependent => :destroy
  has_many :users, :through => :definer_users
  has_many :deliveries_courses#, :dependent => :destroy
  has_many :deliveries, :through => :deliveries_courses, :dependent => :destroy
  has_many :assignments#, :dependent => :destroy
  has_many :surveyings, :dependent => :destroy
  has_many :surveys, :through => :surveyings, :dependent => :destroy
  has_many :response_to_the_evaluations, :dependent => :destroy
  has_many :discussions_coursess, :dependent => :destroy
  has_many :discussions, :through => :discussions_coursess, :dependent => :destroy
  belongs_to :network
  has_many :comments, :dependent => :destroy

  has_many :activities, as: :activitye#, :dependent => :destroy

 #publications/walls
  has_many :coursepublicationings, :dependent => :destroy
  has_many :walls, :through => :coursepublicationings

  #se declara la presencia de los campos que deben ser llenados en el modelo de curso

  validates_presence_of :title
  validates_presence_of :silabus
  validates_presence_of :init_date
  validates_presence_of :finish_date
  validates_presence_of :survey_param_evaluation
  validates_presence_of :delivery_param_evaluation
  validates_presence_of :network_id


  attr_accessible :id, :title, :silabus, :init_date, :finish_date,
                  :created_at, :updated_at, :public_status,
                  :avatar, :coverphoto, :delivery_id,
                  :survey_param_evaluation, :delivery_param_evaluation,
                  :network_id, :active_status


  #para los likes
  acts_as_votable

  #comentarios para los cursos
  acts_as_commentable

  #avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader

  after_create do
    if self.public_status == 'public'
      Wall.create :users => self.users, :publication => self, :network => self.network, :courses => [self], :public =>true
      self.users.each do |u|
        Notification.create :user => u, :notificator => self, :kind => 'new_public_course_on_network'
      end
    end
  end

  def self.import(file,network)
    arrayErrores = Array.new
    count = 1
    begin
      file.path
    rescue NoMethodError
      return arrayErrores.push({:line => 0, :message => "No selecciono un archivo" })
    end
    CSV.foreach(file.path, headers: true) do |row|
      count += 1
      if !row["id"].nil? then
        course = find_by_id(row["id"]) || new
      else
        course = new
      end
      course.attributes = row.to_hash.slice(*accessible_attributes)

      errors = false
      if course.survey_param_evaluation.to_i +
          course.delivery_param_evaluation.to_i != 100 then
        arrayErrores.push({:line => count, :message => "El porcentaje de examenes o tareas es incorrecto"})
        errors = true
      end

      if !errors then
        begin
          course.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.errors.each do |error|
            arrayErrores.push({ :line => count, :message => "Falta especificar: " + error.to_s})
          end
        end
      end
    end
    return arrayErrores
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

  def course_avatarx
    'course-avatarx.png'
  end
  def course_avatarxx
    'course-avatarxx.png'
  end
  def course_avatarxxx
    'course-avatarxxx.png'
  end
  def course_avatarxxxx
    'course-avatarxxxx.png'
  end
  def image_coursex
    'imagecoursex.png'
  end
end
