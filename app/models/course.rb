# -*- coding: utf-8 -*-
class Course < ActiveRecord::Base

  has_many :members_in_courses, dependent: :destroy
  has_many :response_to_the_evaluations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, as: :activitye
  has_many :assignments
  has_many :deliveries_courses, dependent: :destroy
  has_many :deliveries, through: :deliveries_courses, dependent: :destroy
  has_many :surveyings, dependent: :destroy
  has_many :surveys, through: :surveyings, dependent: :destroy
  has_many :discussions_courses, dependent: :destroy
  has_many :discussions, through: :discussions_courses, dependent: :destroy
  has_many :coursepublicationings
  has_many :walls, through: :coursepublicationings
  has_many :course_id_course_file_id
  has_many :course_files, through: :course_id_course_file_id
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy

  belongs_to :network

  validates_associated :network

  validates :title, :active_status, presence: true
  validates :silabus, presence: true, allow_blank: true
  validates :public_status, inclusion: { in: %w(Private public) }

  attr_accessible :id, :title, :silabus, :init_date, :finish_date,
    :created_at, :updated_at, :public_status,
    :avatar, :coverphoto, :delivery_id,
    :network_id, :active_status, :course_files

  attr_accessible :evaluation_criteria_attributes

  accepts_nested_attributes_for :evaluation_criteria, allow_destroy: true

  acts_as_votable
  acts_as_commentable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader

  after_create do
    if self.public_status == 'public'
      users  = self.network.users
      owners = self.members_in_courses
      owners = owners.reject { |member| member.owner != true }
      users  = users - owners
      Wall.create users: self.users, publication: self, network: self.network, courses: [self], public: true
    end
  end

  after_update do
    active_status = self.changes[:active_status]

    if (!active_status.nil?) then
      if (active_status[0] and !active_status[1]) then

        notifications = Notification.where(:notificator_type => "Course", :notificator_id => id)

        notifications.each do |notification|
          notification.destroy
        end

      end
    end
  end

  after_destroy do
    walls = Wall.where(:publication_type => "Course", :publication_id => id)

    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(:notificator_type => "Course", :notificator_id => id)

    notifications.each do |notification|
      notification.destroy
    end

    self.members_in_courses.each do |mic|
      notificacion = Notification.where(:notificator_type =>"MembersInCourse", :notificator_id => mic.id)
      notificacion.destroy
    end
  end

  def import(path,network,user_admin)
    arrayErrores = Array.new
    count = 1

    CSV.foreach(path, headers: true) do |row|
      count += 1
      if !row["id"].nil? then
        course = Course.find_by_id(row["id"]) || Course.new
      else
        course = Course.new
      end

      errors = false

      hash = row.to_hash

      title = hash.delete("Nombre")
      silabus = hash.delete("Descripcion")
      init_date = hash.delete("Fecha de Inicio")
      finish_date = hash.delete("Fecha de Finalizacion")
      public_status = hash.delete("Estatus")

      if public_status.nil? then
        arrayErrores.push({:line => count, :message => "No se especifico un estatus del curso" })
        errors = true
      else
        public_status = public_status.downcase.strip
        public_status = "public" if public_status == "publico"
        public_status = "Private" if public_status == "privado"

        if public_status != "public" and public_status != "Private" then
          arrayErrores.push({:line => count, :message => "No se especifico un estatus correcto en el curso" })
          errors = true
        end
      end

      course.network_id = network.id
      course.active_status = true

      if !errors then
        begin
          course.title = title
          course.silabus = silabus
          course.init_date = init_date
          course.finish_date = finish_date
          course.public_status = public_status
          course.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.errors.each do |error|
            arrayErrores.push({ :line => count, :message => "Falta especificar: " + error.to_s})
          end
        end
      end
    end
    begin
      mail = Notifier.send_import_courses(user_admin,arrayErrores)
      mail.deliver
    rescue
    end
  end

  handle_asynchronously :import, :priority => 20, :run_at => Proc.new{Time.zone.now}

  def self.search(search)
    if search
      @searcher = find(:all, :conditions => ['lower(courses.title) LIKE ?', "%#{search}%"])
    else
      find(:all, :order => :title)
    end
  end

  ####es necesario sustituir el tipo de lectura de la relación manualmente #####
  ########## se crea el campo users en el modelo para poder generar la lectura correcta dentro de las relaciones ######
  def razon_users
    @members = self.members_in_courses #.where(:accepted => true)
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

  def owners
    members_in_course = self.members_in_courses
    owners = members_in_course.keep_if {|m| m.owner}
    owners = owners.map { |o| o.user}
    return owners
  end

  def owner?(role,user)
    if role == "admin" || role == "superadmin" then
      return true
    end
    members = members_in_courses
    owners = members.keep_if{ |x| x.owner == true}
    users_id = owners.map{|x| x.user_id}
    return users_id.include?(user.id)
  end

  # Para verificar si todavía no expira
  def expired?
    if !self.finish_date.nil?
      @expired_in  = self.finish_date

      if @expired_in < DateTime.now
        @expired = true
      else
        @expired = false
      end

      if @expired == true
        Notification.create(:users => self.owners, :notificator => self, :kind => 'course_expired')
      end
    end
  end

end
