class Discussion < ActiveRecord::Base

  has_many :activities, as: :activitye
  has_many :assets, through: :discussion_assets
  has_many :contents, as: :contentye
  has_many :courses, through: :discussion_course
  has_many :discussion_assets, dependent: :destroy
  has_many :discussion_course, dependent: :destroy
  has_many :discussion_responses, dependent: :destroy
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy
  has_many :events, as: :schedule, dependent: :destroy
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
      users = []
      users_notifications = []
      course = self.courses.first
      course.members_in_courses.each do |member|
        if member.accepted == true then
          user = member.user
          if user.id != self.user_id then
            users_notifications.push(user)
          end
          users += [user]
        end
      end

      Wall.create :users => users, :publication => self, :network => self.network, :courses => self.courses
      if self.publish_date.nil? && self.publish_date < DateTime.now
        Notification.create users: users_notifications, notificator: self, kind: 'new_discussion_on_course'
        self.send_mail(users_notifications)
      end
    end
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
    @state = "published"
  end

  def max_courses
    errors.add(:courses, "Solamente puede tener un curso asociado al delivery") if courses.length >= 2
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

end
