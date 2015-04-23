class Discussion < ActiveRecord::Base
  include TrackMixpanelEventModule

  has_many :activities, as: :activitye
  has_many :assets, through: :discussion_assets
  has_many :contents, as: :contentye
  has_many :courses, through: :discussion_course
  has_many :discussion_assets, dependent: :destroy
  has_many :discussion_course, dependent: :destroy
  has_many :discussion_responses, dependent: :destroy
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :events, as: :schedule, dependent: :destroy
  has_many :reported_contents, as: :reportable, dependent: :destroy


  attr_accessible :evaluation_criteria, :title, :description, :publish_date, :end_date, :evaluable
  attr_accessible :evaluation_criteria_attributes
  attr_accessible :contents_attributes

  belongs_to :network
  belongs_to :user

  validate :max_courses
  validates_presence_of :user

  accepts_nested_attributes_for :contents
  accepts_nested_attributes_for :evaluation_criteria

  acts_as_commentable
  acts_as_votable

  # autoconversion de links, links inteligentes
  # this is defined in config/initializers/auto_html.rb
  auto_html_for :description do
    html_escape
    image
    dailymotion        width: "100%", height: 250
    google_map         width: "100%", height: 250
    google_video       width: "100%", height: 250
    metacafe           width: "100%", height: 250
    soundcloud         width: "100%", height: 250
    twitter            width: "100%", height: 250
    vimeo              width: "100%", height: 250
    youtube            width: "100%", height: 250
    prezi_with_wmode   width: "100%", height: 360
    livestrem_support  width: "100%", height: 360
    slideshare_support width: "100%"
    ustream_support    width: "100%"
    link               target: "_blank", rel: "nofollow"
    redcarpet
    simple_format
  end

  after_create do
    #con esto se guarda en wall
    if self.courses.count == 0 # si es publica @todo aqui hay volverla publica
      Wall.create( :publication => self, :network => self.network, :public => true)
    else
      Wall.create :users => self.users, :publication => self, :network => self.network, :courses => self.courses
      Event.create title: self.title, starts_at: self.publish_date, ends_at: self.end_date, schedule_id: self.id, schedule_type: "Discussion", network_id: self.network.id if self.evaluable?

      if self.publish_date > DateTime.now
        ScheduledJob::NotificationsWorker.perform_at(self.publish_date, self.id, self.class.name, 'new_discussion_on_course')
        ScheduledJob::SendMailsWorker.perform_at(self.publish_date, self.id, self.class.name)
      else
        Notification.create users: self.accepted_users, notificator: self, kind: 'new_discussion_on_course'
        self.send_mail(self.accepted_users)
      end
    end
    track_mixpanel_discussion
  end

  after_destroy do
    walls = Wall.where(:publication_type => "Discussion", :publication_id => id)

    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(:notificator_type => "Discussion", :notificator_id => self.id)

    notifications.each do |notification|
      notification.destroy
    end
  end

  def publish_date
    read_attribute(:publish_date) || self.created_at
  end

  def state
    if self.publish_date <= DateTime.now and self.end_date > DateTime.now
      @state = "published"
    else
      @state = "unpublish"
    end
  end

  def max_courses
    errors.add(:courses, "Solamente puede tener un curso asociado al delivery") if courses.length >= 2
  end

  def owner?(role,user)
    if role == "admin" || role == "superadmin" then
      return true
    end

    if self.courses.count > 0
      course_owner_discussion = self.courses.first.owner?(role,user)
    else
      course_owner_discussion = false
    end

    return (user_id == user.id or course_owner_discussion)
  end

  def send_mail(users)
    Thread.new {
      begin
        mail = Notifier.new_discussion_notification(users,self)
        mail.deliver
      rescue => ex
      ensure
        ActiveRecord::Base.connection.close
      end
    }
  end

  def responses
    discussion_responses
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
  
  private
  def track_mixpanel_discussion
    public_discussion = self.courses.blank?
    event_data = {
      'Network'   => self.network.name.capitalize,
      'Subdomain' => self.network.subdomain,
      'Role'      => self.user.role_title.capitalize,
      'Course'    => public_discussion ? 'Public' : self.courses.first.title.capitalize,
      'Evaluable' => self.evaluable? ? 'Evaluable' : 'Non-evaluable'
    }
    track_event self.user.id, 'Discussion', event_data
  end

end
