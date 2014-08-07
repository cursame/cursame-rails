class Discussion < ActiveRecord::Base

  has_many :discussions_coursess, dependent: :destroy
  has_many :courses, through: :discussions_coursess
  has_many :activities, as: :activitye
  has_many :contents, as: :contentye
  has_many :evaluation_criteria, as: :evaluable, dependent: :destroy

  attr_accessible :evaluation_criteria, :title, :description

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
    dailymotion  :width => "100%", :height => 250
    google_map   :width => "100%", :height => 250
    google_video :width => "100%", :height => 250
    metacafe     :width => "100%", :height => 250
    soundcloud   :width => "100%", :height => 250
    twitter      :width => "100%", :height => 250
    vimeo        :width => "100%", :height => 250
    youtube      :width => "100%", :height => 250
    slideshare_support :width => "100%"
    ustream_support    :width => "100%"
    prezi_with_wmode   :width => "100%", :height => 360
    livestrem_support  :width => "100%", :height => 360
    link :target => "_blank", :rel => "nofollow"
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
      Notification.create(:users => users_notifications, :notificator => self, :kind => 'new_discussion_on_course')
      self.send_mail(users_notifications)
    end

    begin

      permissioning = Permissioning.find_by_user_id_and_network_id(self.user_id, self.network.id)

      if !self.courses.nil? && !self.courses.empty?
        self.courses.each do |course|
          mixpanel_properties = {
            'Network' => self.network.name.capitalize,
            'Course'  => course.title.capitalize,
            'Role'    => permissioning.role.title.capitalize
          }
          MixpanelTrackerWorker.perform_async self.user_id, 'Discussions', mixpanel_properties
        end
      else
        mixpanel_properties = {
          'Network' => self.network.name.capitalize,
          'Course'  => 'Public',
          'Role'    => permissioning.role.title.capitalize
        }
        MixpanelTrackerWorker.perform_async self.user_id, 'Discussions', mixpanel_properties
      end

    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
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

end
