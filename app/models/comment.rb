class Comment < ActiveRecord::Base
  # para agilizar la creacion de notificaciones en tareas
  # after_commit :create_notifications, :on => :create


  include ActsAsCommentable::Comment
  #include UtilityHelper

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

  validates_presence_of :user


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
    youtube :width => "100%", :height => 250
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

  after_destroy do

    walls = Wall.where(:publication_type => "Comment", :publication_id => id)

    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(:notificator_type => "Comment", :notificator_id => self.id)
    notifications.each do |notification|
      notification.destroy
    end
  end

  after_create do
    hash = group_of_users(commentable_type)

    users = hash[:users]
    notification_kind = hash[:kind]

    puts '--------------------------------'
    puts notification_kind

    if notification_kind["network"]
      puts '------------aqui--------------------'
      puts self.user.id
      Wall.create!( :users => [self.user], :publication => self, :network => self.network, :public => true)
      users = users.reject{ |user| user.id == self.user_id }

      # Notification.create(:users => users, :kind => notification_kind, :notificator => self)
      return
    elsif notification_kind["course"] || notification_kind["group"]

      course = notification_kind["course"] ? [commentable] : nil

      wall = Wall.create(:publication => self, :network => self.network, :users => users,:public => false, :courses => course)

      users = users.reject{ |user| user.id == self.user_id }
      Notification.create(:users => users, :kind => notification_kind, :notificator => self)
      return
    elsif notification_kind["discussion"]

      users = users.reject { |user| user.id == self.user.id }

      Notification.create(:users => users, :kind => notification_kind, :notificator => self)

      return
    elsif notification_kind["delivery"] || notification_kind["on_comment"]

      users = users.reject { |user| user.id == self.user.id }

      Notification.create(:users => users, :kind => notification_kind, :notificator => self)

    elsif notification_kind["on_user"]

      Wall.create(:publication => self, :network => self.network, :users => users, :public => false)

      users = users.reject { |user| user.id == self.user.id }
      Notification.create(:users => users, :kind => notification_kind, :notificator => self)

      return
    else
    end
  end


  def group_of_users(comment_type)
    case comment_type
      when "Network", "Course", "Group", "Delivery"
      users = commentable.users
      hash = {:users => users,:kind => 'user_comment_on_' + comment_type.downcase}
      return hash

    when "User"
      users = [commentable]
      hash = {:users => users, :kind => 'user_comment_on_' + comment_type.downcase }
      return hash
    when "Comment"
      if commentable.commentable_type == "User"
        users = [commentable.commentable]
        hash = { :users => users, :kind => 'user_comment_on_' + comment_type.downcase}
        return hash
      elsif commentable.commentable_type == "Network"
        users = [commentable.user]
        hash = { :users => users, :kind => 'user_comment_on_' + comment_type.downcase}
        return hash
      else
        users = commentable.commentable.users
        users = users.reject { |user| user.id == self.user.id }
        hash = { :users => users, :kind => 'user_comment_on_' + comment_type.downcase}
        return hash
      end
      # users.delete(self.user)


    when "Discussion"

      if commentable.courses.size == 0 then
        hash = {:users => [commentable.user] , :kind => 'user_comment_on_' + comment_type.downcase }
      else
        courses = commentable.courses
        users = []
        courses.each do |course|
          users = users.concat(course.users)
        end
        users.uniq!
        # users.delete(self.user)
        users = users.reject { |user| user.id == self.user.id }
        hash = {:users => users, :kind => 'user_comment_on_' + comment_type.downcase }
      end

      return hash
      when 'Survey'
      if commentable.courses.size == 0 then
        hash = {:users => [] , :kind => 'user_comment_on_' + comment_type.downcase }
      else
        courses = commentable.courses
        users = []
        courses.each do |course|
          users = users.concat(course.users)
        end
        users.uniq!
        # users.delete(self.user)
        users = users.reject { |user| user.id == self.user.id }
        hash = {:users => users, :kind => 'user_comment_on_' + comment_type.downcase }
      end
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

    if commentable_type == "User" then
      return true if commentable_id == user.id
      return true if user_id == user.id
      return false
    end
    return commentable.owner?(role,user)
  end
end
