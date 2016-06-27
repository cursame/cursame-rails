# -*- coding: utf-8 -*-
class Course < ActiveRecord::Base
  include TrackMixpanelEventModule

  has_one :library, as: :storable, dependent: :destroy

  has_many :members_in_courses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, as: :activitye
  has_many :assignments
  has_many :deliveries_courses, dependent: :destroy
  has_many :deliveries, through: :deliveries_courses, dependent: :destroy
  has_many :surveyings, dependent: :destroy
  has_many :surveys, through: :surveyings, dependent: :destroy
  has_many :discussion_course, dependent: :destroy
  has_many :discussions, through: :discussion_course, dependent: :destroy
  has_many :coursepublicationings
  has_many :walls, through: :coursepublicationings
  has_many :course_id_course_file_id
  has_many :course_files, through: :course_id_course_file_id
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :files, class_name: 'LibraryFile', through: :library
  has_many :evaluation_periods, dependent: :destroy, order: "id ASC"

  belongs_to :network
  belongs_to :school

  validates_associated :network

  validates :title, presence: true
  validates :silabus, presence: true, allow_blank: true
  validates :active_status, inclusion: { in: [true, false] }

  attr_accessible :id, :title, :silabus, :init_date,
    :created_at, :updated_at,
    :avatar, :coverphoto, :delivery_id,
    :network_id, :active_status, :course_files, :school_id

  attr_accessible :evaluation_criteria_attributes

  accepts_nested_attributes_for :evaluation_criteria, allow_destroy: true

  attr_accessible :evaluation_periods_attributes

  accepts_nested_attributes_for :evaluation_periods, allow_destroy: true

#gemas
  acts_as_votable
  acts_as_commentable

#gemas
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader

  after_create do
    create_library
    mixpanel_track_event
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

      course.network_id = network.id
      course.active_status = true

      if !errors then
        begin
          course.title = title
          course.silabus = silabus
          course.init_date = init_date
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
    if role == "admin" || role == "superadmin" || role == "operator"
      return true
    end
    members = members_in_courses
    owners = members.keep_if{ |x| x.owner == true}
    users_id = owners.map{|x| x.user_id}
    return users_id.include?(user.id)
  end

  # Returns the array of teachers in this course
  def teachers
    self.users.keep_if { |user| user.teacher? }
  end

  # Returns the array of students in this course
  def students
    self.users.keep_if { |user| user.student? }
  end

  # Returns true if there is any evaluable member
  def empty?
    self.members_in_courses.reject { |member| !member.has_evaluation? }.empty?
  end

  # Returns the array of evaluable members of this course
  def evaluable_members
    self.members_in_courses.reject { |member| !member.has_evaluation? }
  end

  def evaluables_discussiones
    self.discussions.reject { |discussion| not discussion.evaluable? }
  end

  def course_events
    surveys_events + deliveries_events + discussions_events
  end

  # Returns the array of surveys events for this course
  def surveys_events
    self.surveys.each.map { |survey| survey.events }.flatten
  end

  # Returns the array of deliveries events for this course
  def deliveries_events
    self.deliveries.each.map { |deliveries| deliveries.events }.flatten
  end

  # Returns the array of discussions events for this course
  def discussions_events
    self.discussions.each.map { |discussions| discussions.events }.flatten
  end

  # Evaluates the
  def evaluate_members!
    self.members_in_courses do |member|
      meber.evaluate!
    end
  end

  def update_members (users, current_user)
    current_members = MembersInCourse.find_all_by_course_id self.id
    current_members.keep_if do |member|
      member.user != current_user
    end

    current_members.each do |member|
      member.destroy unless users.include? member.user
    end

    users.each do |user|
      member = MembersInCourse.find_by_user_id_and_course_id(user.id,self.id)
      if member.nil?
        MembersInCourse.create(owner: user.teacher?, course: self, user: user, network_id: self.network_id, accepted: true)
      else
        member.update_attribute :accepted, true
      end
    end
  end

  def add_teachers users
    teachers = []
    users.each do |user|
      teachers.push MembersInCourse.new(owner: true, course: self, user: user, network_id: self.network, accepted: true) unless user.nil?
    end
    return teachers
  end

  def new_evaluation_criteria
    evaluation_periods.map { |period| period.new_evaluation_criteria }
  end

  def cursame_criteria
    !self.evaluation_criteria.keep_if { |criterium| ['cursame_deliveries', 'cursame_surveys', 'cursame_discussions'].include? criterium.name }.blank?
  end

  def cursame_percentage_old
    self.evaluation_criteria.inject(100) { |score, criteria| score - criteria.evaluation_percentage }
  end

  private
  def mixpanel_track_event
    event_data = {
      'Type'    => 'private',
      'Network' => self.network.name.capitalize,
      'Subdomain' => self.network.subdomain
    }
    track_event self.id, 'Courses', event_data
  end

  def create_library
    Library.create(title: title, description: silabus, storable: self, network: network)
  end
end
