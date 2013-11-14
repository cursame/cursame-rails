class Survey < ActiveRecord::Base
 # attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :show

  has_many :questions, :dependent => :destroy
  has_many :surveyings, :dependent => :destroy
  has_many :courses, :through => :surveyings
 # has_many :compart_assets, :dependent => :destroy
  # has_many :assets, :through => :compart_assets
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

  ###### validando la presencia de algunos rubros #######
  validates_presence_of :courses
  validates_presence_of :questions
  validates_presence_of :user



  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  state_machine :state, :initial => :unpublish do
    state :unpublish
    state :published
    event :publish do
      transition :to => :published, :from => :unpublish
    end
  end

  after_destroy do
    walls = Wall.where(:publication_type => "Survey", :publication_id => self.id)

    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(:notificator_type => "Survey", :notificator_id => self.id)

    notifications.each do |notification|
      notification.destroy
    end
  end

  before_create do
    self.publish_date ||= DateTime.now
  end

  after_create do

    if self.publish_date <= DateTime.now then
       self.publish!
    end

    Event.create(:title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date,
          :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id,
          :course_id => self.course_ids, :network_id => self.network_id)



    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        if self.user_id != user.id then
          users.push(user)          
        end
      end
    end

    Wall.create(:publication => self, :network => self.network, :courses => self.courses, :users => users)

    users = users.reject { |user| user.id == self.user_id }
    self.send_mail(users)
    Notification.create(:users => users, :notificator => self, :kind => "new_survey_on_course")
  end

  def expired?
    if self.end_date < DateTime.now
    @expired = true
    else
    @expired = false
    end

    if  @expired == true
       self.state = 'unpublish'
       self.save!
     end
  end

   def self.publish_new_surveys
     Survey.unpublished.each do |survey|
       if survey.start_at <= DateTime.now
         if survey.end_date >= DateTime.now
         survey.publish!
         end
       end
     end
   end

  def self.user
    User.last
  end

  def title
     self.name
  end

  def owner?(role,user)
    if role == "admin" || role == "superadmin" then
      return true
    end
    return user_id == user.id
  end

  #
  # Metodos para el analitics
  #

  def averageCalification
    user_surveys = self.user_surveys
    size = user_surveys.size
    if (size == 0) then
      return 0.0
    end
    average = 0.0
    user_surveys.each do
      |user_survey|
      average += user_survey.result
    end
    return average/size
  end

  def send_mail(users)
    Thread.new {
      begin
        mail = Notifier.new_survey_notification(users,self)
        mail.deliver          
      rescue => ex
        puts 'error al enviar mail'
      ensure
        ActiveRecord::Base.connection.close
      end
    }    
  end

end
