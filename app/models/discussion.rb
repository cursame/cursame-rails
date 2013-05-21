class Discussion < ActiveRecord::Base
   has_many :discussions_coursess, :dependent => :destroy
   has_many :courses, :through => :discussions_coursess
   has_many :activities, as: :activitye#, :dependent => :destroy

   belongs_to :network
   belongs_to :user

  validate :max_courses


  #comentarios para las discusiones
  acts_as_commentable
  #para los likes
  acts_as_votable

  #autoconversion de links, links inteligentes
  auto_html_for :description do
    html_escape
    image
    # This is defined in config/initializers/auto_html.rb
    dailymotion :width => "100%", :height => 250
    #flickr :width => 400, :height => 250
    google_map :width => "100%", :height => 250
    google_video :width => "100%", :height => 250
    metacafe :width => "100%", :height => 250
    soundcloud :width => "100%", :height => 250
    twitter :width => "100%", :height => 250
    vimeo :width => "100%", :height => 250
    youtube_js_api :width => "100%", :height => 250
    slideshare_support :width => "100%"
    ustream_support :width => "100%"
    prezi_with_wmode :width => "100%", :height => 360
    livestrem_support :width => "100%", :height => 360
    link :target => "_blank", :rel => "nofollow"
    redcarpet
    #sanitize
    simple_format
  end

  after_create do
    #con esto se guarda en wall
    if self.courses.count == 0 # si es publica @todo aqui hay volverla publica
      Wall.create( :publication => self, :network => self.network, :public => true)
    else
      users =[]
      self.courses.each do |course|
        users+= course.users
        course.members_in_courses.each do |member|
          if member.accepted == true
             user = member.user
            if user.id != self.user_id
              Notification.create(:user => user, :notificator => self, :kind => 'new_discussion_on_course')
            end
          end
        end
      end
      Wall.create! :users => users, :publication => self, :network => self.network, :courses => self.courses
    end
  end

  before_destroy do
    walls = Wall.where(:publication_type => "Discussion", :publication_id => id)
    notifications = Notification.where(:notificator_type => "Discussion", :notificator_id => id)

    walls.each do |wall|
      wall.destroy
    end
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
end
