class Survey < ActiveRecord::Base

  has_many :activities, as: :activitye, dependent: :destroy
  has_many :assets, through: :survey_assets
  has_many :comments, dependent: :destroy
  has_many :courses, through: :surveyings
  has_many :events, as: :schedule, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :surveyings, dependent: :destroy
  has_many :user_surveys, dependent: :destroy
  has_many :survey_assets, dependent: :destroy

  belongs_to :network
  belongs_to :poll
  belongs_to :user

  validates_presence_of :courses
  validates_presence_of :questions
  validates_presence_of :user

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assets

  acts_as_commentable
  acts_as_votable

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
      self.state = "published"
    end

    Event.create(:title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id, :network_id => self.network_id)

    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        if self.user_id != user.id then
          users.push(user)
        end
      end
    end

    self.expired?
    Wall.create(:publication => self, :network => self.network, :courses => self.courses, :users => users)

    users = users.reject { |user| user.id == self.user_id }
    self.send_mail(users)
    Notification.create(:users => users, :notificator => self, :kind => "new_survey_on_course")

    begin
      self.courses.each do |course|
        mixpanel_properties = {
          'Network' => self.network.name.capitalize,
          'Course'  => course.title.capitalize
        }
        MixpanelTrackerWorker.perform_async self.user_id, 'Surveys', mixpanel_properties
      end
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end

  end

  def expired?
    ##### se detecta si es tiempo de estar publicado el survey ####
    case
    when self.publish_date < DateTime.now
      self.state = "published"
    when self.publish_date == DateTime.now
      self.state = "published"
    when self.publish_date > DateTime.now
      self.state = "unpublish"
    end

    case
    when self.end_date < DateTime.now
      self.state = "unpublish"
    when self.end_date == DateTime.now
      self.state = "unpublish"
    when self.end_date > DateTime.now
      self.state = "published"
    end

    self.save!

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

  def send_mail(users)
    Thread.new {
      begin
        mail = Notifier.new_survey_notification(users,self)
        mail.deliver
      rescue => ex
      ensure
        ActiveRecord::Base.connection.close
      end
    }
  end

  def responses
    user_surveys
  end

end
