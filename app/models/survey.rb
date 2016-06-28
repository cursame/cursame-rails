class Survey < ActiveRecord::Base

  attr_accessible :evaluation_period, :evaluation_period_id, :name, :publish_date, :end_date,
                  :questions_attributes, :timer

  has_many :activities, as: :activitye, dependent: :destroy
  has_many :assets, through: :survey_assets
  has_many :comments, dependent: :destroy
  has_many :courses, through: :surveyings
  has_many :events, as: :schedule, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :surveyings, dependent: :destroy
  has_many :user_surveys, dependent: :destroy
  has_many :survey_assets, dependent: :destroy
  has_many :contents, as: :contentye
  has_many :reported_contents, as: :reportable, dependent: :destroy
  has_many :time_trying_surveys

  belongs_to :network
  belongs_to :poll
  belongs_to :user
  belongs_to :evaluation_period

  validates_presence_of :courses
  validates_presence_of :questions
  validates_presence_of :user
  validates_presence_of :publish_date
  validates_presence_of :evaluation_period, :unless => lambda { self.courses.first.evaluation_periods.empty? }

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :contents

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
    Wall.create(:publication => self, :network => self.network, :courses => self.courses, :users => self.users)
    Event.create title: self.name, starts_at: self.publish_date, ends_at: self.end_date, schedule_id: self.id, schedule_type: "Survey", network_id: self.network_id

    if self.publish_date > DateTime.now
      ScheduledJob::NotificationsWorker.perform_at(self.publish_date, self.id, self.class.name, 'new_survey_on_course')
      ScheduledJob::SendMailsWorker.perform_at(self.publish_date, self.id, self.class.name)
    else
      Notification.create(:users => self.accepted_users, :notificator => self, :kind => "new_survey_on_course")
      self.send_mail self.accepted_users
    end

    begin
      self.courses.each do |course|
        mixpanel_properties = {
          'Network'   => self.network.name.capitalize,
          'Subdomain' => self.network.subdomain,
          'Course'    => course.title.capitalize
        }
        MixpanelTrackerWorker.perform_async self.user_id, 'Surveys', mixpanel_properties
      end
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end

  end

  def after_update_survey
    self.user_surveys.each {|user_survey| user_survey.destroy }

    event = Event.find_by_schedule_id_and_schedule_type(self.id, self.class.name)
    event.update_attributes(title: self.name, starts_at: self.publish_date, ends_at: self.end_date)

    Notification.create(:users => self.accepted_users, :notificator => self, :kind => "edit_survey_on_course") if self.publish_date < DateTime.now
  end

  def expired?
    ##### se detecta si es tiempo de estar publicado el survey ####
    if self.publish_date <= DateTime.now and self.end_date > DateTime.now
      self.state = 'published'
    else
      self.state = 'unpublish'
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
    if role == "admin" || role == "superadmin" || role == "operator"
      return true
    end
    return (user_id == user.id or self.courses.first.owner?(role,user))
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

  def users
    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        users.push(user) if member.accepted?
      end
    end
    return users
  end

  def accepted_users
    users = []
    self.courses.each do |course|
      course.members_in_courses.each do |member|
        user = member.user
        users.push(user) if user.id != self.user_id && member.accepted?
      end
    end
    return users
  end

  def deadline
    if end_date.nil?
      I18n.t('survey.nil_end_date')
    else
      "#{I18n.t('survey.deadline')} #{I18n.l(end_date, format: :short)}"
    end
  end
end
