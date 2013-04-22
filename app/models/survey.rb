class Survey < ActiveRecord::Base
 # attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :show

  has_many :questions, :dependent => :destroy
  has_many :surveyings, :dependent => :destroy
  has_many :courses, :through => :surveyings
  has_many :compart_assets, :depedent => :destroy
  has_many :assets, :through => :compart_assets
  has_many :events, as: :schedule, :dependent => :destroy
  belongs_to :network
  belongs_to :poll
  has_many :user_surveys, :dependent => :destroy

  belongs_to :user
  has_many :activities, as: :activitye, :dependent => :destroy

  #comentarios para las surveys
  has_many :comments, :dependent => :destroy

  acts_as_commentable
  #para los likes
  acts_as_votable


  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  state_machine :state, :initial => :unpublish do
    state :unpublish
    state :published
    event :publish do
      transition :to => :published, :from => :unpublish
    end
  end

  before_create do
    self.publish_date ||= DateTime.now
  end

  after_create do

     if self.publish_date <= DateTime.now then
       #self.update_attributes(:publish => true)
       self.publish!
     else
       #self.update_attributes(:publish => false)
     end

    Event.create :title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id
    self.courses.each do |course|
    course.members_in_courses.each do |u|
      user = User.find_by_id(u.user_id)
      if u.owner != true
        Notification.create :user => user, :notificator => self, :kind => 'new_survey_on_course', :course_id => course.id
      end
      #Notification.create :user => user, :notificator => self, :kind => 'new_survey_on_course', :course_id => course.id
      if (!Wall.find_by_user_id_and_publication_type_and_publication_id(user.id,'Survey',self.id))
        Wall.create :user => user, :publication => self, :network => self.network, :course_id => course.id
      end
    end

end


    #
    # Cuando se crea el survey, se le notifica a caca miembro de los cursos que tiene el survey
    #
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        Notification.create :user => member.user, :notificator => self, :kind => 'new_survey_on_course'
        Wall.create :user => member.user, :publication => self, :network => self.network, :course_id => course.id
        mail = Notifier.new_survey_notification(member,self)
        mail.deliver
      end
    end
  end

  def expired?
     end_date < DateTime.now
   end

   def self.publish_new_surveys
     Survey.unpublished.each do |survey|
       if survey.start_at <= DateTime.now
         survey.publish!
       end
     end
   end

  def self.user
    User.last
  end

  def title
     self.name
  end

end
