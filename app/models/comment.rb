class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  #include UtilityHelper

  #attr_accessible :commentable_type

  belongs_to :commentable, polymorphic: true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  #course belongnings
  belongs_to :network
  belongs_to :course
  belongs_to :phase

  has_many :activities, as: :activitye#, :dependent => :destroy
  has_many :reported_contents, as: :reportable, dependent: :destroy

  validates_presence_of :user
  validates_presence_of :phase_id, :unless => lambda { self.network.subdomain != "meems" ||
                                                       (self.commentable_type != "Network" &&
                                                        self.commentable_type != 'Course') }


  #comentarios para los comentarios
  acts_as_commentable

  #para los likes
  acts_as_votable

  #autoconversion de links, links inteligentes
  auto_html_for :comment do
    html_escape
    image
    # This is defined in config/initializers/auto_html.rb
    dailymotion width: "100%", height: 250
    #flickr width: 400, height: 250
    google_map width: "100%", height: 250
    google_video width: "100%", height: 250
    metacafe width: "100%", height: 250
    soundcloud width: "100%", height: 250
    twitter width: "100%", height: 250
    vimeo width: "100%", height: 250
    youtube width: "100%", height: 250
    slideshare_support width: "100%"
    ustream_support width: "100%"
    prezi_with_wmode width: "100%", height: 360
    livestrem_support width: "100%", height: 360
    link target: "_blank", rel: "nofollow"
    redcarpet
    #sanitize
    simple_format
  end

  #para elegir el elemento que recibir a/o el comentario
  def self.get_commentable(commentable_id,commentable_type)
    #comment = self.find_by_commentable_id(commentable_id)
    commentable_type.camelize.constantize.find(commentable_id)
  end

  after_destroy do

    walls = Wall.where(publication_type: "Comment", publication_id: id)

    walls.each do |wall|
      wall.destroy
    end

    notifications = Notification.where(notificator_type: "Comment", notificator_id: self.id)
    notifications.each do |notification|
      notification.destroy
    end
  end

  after_create do

    hash = group_of_users(commentable_type)

    users = hash[:users]
    notification_kind = hash[:kind]

    network = Network.find_by_id(self.network_id)
    permissioning = Permissioning.find_by_user_id_and_network_id(self.user_id, network.id)

    if notification_kind["network"]
      Wall.create!( users: [self.user], publication: self, network: self.network, public: true)
      users = users.reject{ |user| user.id == self.user_id }
      return
    elsif notification_kind["course"] || notification_kind["group"]
      course = notification_kind["course"] ? [commentable] : nil
      wall = Wall.create(publication: self, network: self.network, users: users,public: false, courses: course)
      users = users.reject { |user| user.id == self.user_id || MembersInCourse.find_by_user_id(user.id).accepted != true }
      Notification.create(users: users, kind: notification_kind, notificator: self)
      return
    elsif notification_kind["discussion"]
      users = users.reject { |user| user.id == self.user.id }
      Notification.create(users: users, kind: notification_kind, notificator: self)
      return
    elsif notification_kind["delivery"] || notification_kind["on_comment"]
      users = users.reject { |user| user.id == self.user.id }
      Notification.create(users: users, kind: notification_kind, notificator: self)
    elsif notification_kind["on_user"]
      Wall.create(publication: self, network: self.network, users: users, public: false)
      users = users.reject { |user| user.id == self.user.id }
      Notification.create(users: users, kind: notification_kind, notificator: self)
      return
    else
    end
  end


  def group_of_users(comment_type)
    case comment_type
    when "Network", "Course", "Group", "Delivery"
      users = commentable.users
      hash = {users: users,kind: 'user_comment_on_' + comment_type.downcase}

      if comment_type == "Course"
        self.send_mail
      end
      return hash

    when "User"
      users = [commentable]
      hash = {users: users, kind: 'user_comment_on_' + comment_type.downcase }
      return hash

    when "Comment"
      if commentable.commentable_type == "User"
        users = [commentable.commentable]
        hash = { users: users, kind: 'user_comment_on_' + comment_type.downcase}
        return hash
      elsif commentable.commentable_type == "Network"
        users = [commentable.user]
        hash = { users: users, kind: 'user_comment_on_' + comment_type.downcase}
        return hash
      else
        users = commentable.commentable.users
        users = users.reject { |user| user.id == self.user.id }
        hash = { users: users, kind: 'user_comment_on_' + comment_type.downcase}

        if commentable.commentable_type == "Course"
          self.send_mail
        end
        return hash
      end

    when "Discussion"
      if commentable.courses.size == 0 then
        hash = {users: [commentable.user] , kind: 'user_comment_on_' + comment_type.downcase }
      else
        courses = commentable.courses
        users = []
        courses.each do |course|
          users = users.concat(course.users)
        end
        users.uniq!
        users = users.reject { |user| user.id == self.user.id }
        hash = {users: users, kind: 'user_comment_on_' + comment_type.downcase }
      end
      return hash

    when 'Survey'
      if commentable.courses.size == 0 then
        hash = {users: [] , kind: 'user_comment_on_' + comment_type.downcase }
      else
        courses = commentable.courses
        users = []
        courses.each do |course|
          users = users.concat(course.users)
        end
        users.uniq!
        users = users.reject { |user| user.id == self.user.id }
        hash = {users: users, kind: 'user_comment_on_' + comment_type.downcase }
      end
    when 'GoogleForm'
      users = commentable.pollable.users
      hash = { users: users, kind: 'user_comment_on_' + comment_type.downcase }
    when 'LibraryFile'
      if commentable.location.storable.kind_of? Library
        users = commentable.location.storable.storable.users
      else
        users = commentable.location.storable.users
      end
      hash = { users: users, kind: 'user_comment_on_' + comment_type.downcase }
    else
      raise "Grupo de usuarios no definido para " + comment_type
    end
  end

  def state
    @state = "published"
  end

  def owner?(role,user)
    if role == "admin" || role == "superadmin" || role == "operator" || user_id == user.id
      return true
    end

    if commentable_type == "User" then
      return true if commentable_id == user.id
      return true if user_id == user.id
      return false
    end

    if commentable_type == 'Discussion' and commentable.courses.count > 0
      return (commentable.courses.first.owner?(role,user) or commentable.owner?(role,user))
    end
    if commentable_type == 'Delivery' or commentable_type == 'Survey'
      return (commentable.courses.first.owner?(role,user) or commentable.owner?(role,user))
    end

    if commentable_type == 'LibraryFile'
      return false
    end

    if commentable_type == 'GoogleForm'
      return false
    end

    return commentable.owner?(role,user)
  end

  def send_mail
    Thread.new {
      begin
        mailer = Notifier.send_comment_on_course(self)
        mailer.deliver
      rescue => ex
      ensure
        ActiveRecord::Base.connection.close
      end
    }
  end

  def title
    return ""
  end
end
