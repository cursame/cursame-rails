class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  #attr_accessible :commentable_type

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  #assets
  has_many :compart_assets, :dependent => :destroy
  has_many :assets, :through => :compart_assets, :source => :comment

  #course belongnings
  belongs_to :network
  belongs_to :course
  has_many :activities, as: :activitye#, :dependent => :destroy

  #comentarios para los comentarios
  acts_as_commentable

  #para los likes
  acts_as_votable

  #autoconversion de links, links inteligentes
  auto_html_for :comment do
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

  #agregar un asset al comentario
  # accepts_nested_attributes_for :compart_assets

  #para elegir el elemento que recibir a/o el comentario
  def self.get_commentable(commentable_id,commentable_type)
    #comment = self.find_by_commentable_id(commentable_id)
    commentable_type.camelize.constantize.find(commentable_id)
  end

  before_destroy do
    notifications = Notification.where(:notificator_type => "Comment",:notificator_id => id)
    walls = Wall.where(:publication_type => "Comment",:publication_id => id)
    walls.each do |wall|
      wall.destroy
    end

    notifications.each do |notification|
      notification.destroy
    end
  end

  after_create do
    hash = group_of_users(commentable_type)

    users = hash[:users]
    notification_kind = hash[:kind]

    if notification_kind["network"]

      Wall.create( :publication => self, :network => self.network, :public => true)
      users = users.reject{ |user| user.id == self.user.id }

      users.each do |user|
        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
      end
      return
    elsif notification_kind["course"] || notification_kind["group"]

      course = notification_kind["course"] ? [commentable] : nil

      wall = Wall.create(:publication => self, :network => self.network, :users => users,:public => false, :courses => course)

      users.reject{ |user| user.id == self.user.id }

      users.each do |user|
        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
      end
      return
    elsif notification_kind["discussion"]

      users.each do |user|
        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
      end
      return
    elsif notification_kind["delivery"] || notification_kind["on_comment"]

      users.reject { |user| user.id == self.user.id }

      users.each do |user|
        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
      end
      return
    elsif notification_kind["on_user"]

      Wall.create(:publication => self, :network => self.network, :users => users, :public => false)
      Notification.create(:user => users.first, :notificator => self, :kind => notification_kind)

      return
    else
      return
    end

  end

  def group_of_users(comment_type)
    case comment_type
    when "Network", "Course", "Group", "Delivery"
      users = commentable.users
      hash = {:users => users,:kind => 'user_comment_on_' + comment_type.downcase}
      return hash

      # Falta agregar cuando el commentable_type, es un usuario

    when "User"
      users = [commentable]
      hash = {:users => users, :kind => 'user_comment_on_' + comment_type.downcase }
      return hash
    when "Comment"
      if commentable.commentable_type == "User"
        users = [commentable.commentable]
      else
        users = commentable.commentable.users
      end
      hash = { :users => users, :kind => 'user_comment_on_' + comment_type.downcase}
      return hash

      when "Discussion"

      if commentable.courses.size == 0 then
        hash = {:users => [] , :kind => 'user_comment_on_' + comment_type.downcase }
      else
        courses = commentable.courses
        users = []
        courses.each do |course|
          users = users.concat(course.users)
        end
        users.uniq!
        hash = {:users => users, :kind => 'user_comment_on_' + comment_type.downcase }
      end

      return hash
    else

      raise "Grupo de usuarios no definido para " + comment_type
    end
  end

  def state
    @state = "published"
  end

  def owner?(role,user)
    if role == "admin" || role == "superadmin" || user_id == user.id then
      return true
    end

    puts "ACA PASO"
    puts commentable_type

    if commentable_type == "User" then
      return true if commentable_id == user.id
      return true if user_id == user.id
    end
    return commentable.owner?(role,user)
  end
end
