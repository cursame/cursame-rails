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
  has_many :compart_assets
  has_many :assets, :through => :compart_assets, :source => :comment

  #course belongnings
  belongs_to :network
  belongs_to :course
  has_many :activities, as: :activitye

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
  accepts_nested_attributes_for :compart_assets

  #para elegir el elemento que recibir a/o el comentario
  def self.get_commentable(commentable_id,commentable_type)
    #comment = self.find_by_commentable_id(commentable_id)
    commentable_type.camelize.constantize.find(commentable_id)
  end

  after_create do
    hash = group_of_users(commentable_type)
    users = hash[:users]

    notification_kind = hash[:kind]
    users = users.reject{|user| user.id == self.user.id}

    course_id = commentable.id if notification_kind["course"]
    course_id = nil if !notification_kind["course"]

    users.each do |user|

      wall = Wall.find_by_user_id_and_publication_id_and_publication_type(user.id,self.id,"Comment")

      if wall.nil? && notification_kind != "user_comment_on_comment" && notification_kind  != "user_comment_on_user"  &&
          notification_kind != "user_comment_on_delivery" then

        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
        Wall.create(:user => user, :publication => self, :network => self.network, :course_id => course_id)
      end

      if notification_kind == "user_comment_on_comment" || notification_kind == "user_comment_on_user" ||
          notification_kind == "user_comment_on_delivery" then
        Notification.create(:user => user, :notificator => self, :kind => notification_kind)
      end
    end

  end

=begin
  after_create do
    case commentable_type
      when "Network"
        commentable.users.reject { |us| us.id == self.user.id }.each do |u|
        # commentable.users.each do |u|
          Notification.create :user => u, :notificator => self, :kind => 'user_comment_on_network'
        end
        #con esto se guarda en wall
        commentable.users.each do |u|
          Wall.create :user => u, :publication => self, :network => self.network, :course_id => nil
        end
      when "Course"
        commentable.users.reject { |us| us.id == self.user.id }.each do |u|
          Notification.create :user => u, :notificator => self, :kind => 'user_comment_on_course'
          Wall.create :user => self.user, :publication => self, :network => self.network, :course_id => commentable.id
        end
      when "Comment"
        # Notification.create :user => commentable.user, :notificator => self, :kind => 'user_comment_on_comment'
      when "User"
        # Notification.create :user => commentable, :notificator => self, :kind => 'user_comment_on_user'
    end
  end
=end

  def group_of_users(comment_type)
    case comment_type

    when "Network", "Course", "Group"
      users = commentable.users
      hash = {:users => users,:kind => 'user_comment_on_' + comment_type.downcase}
      return hash

      # Falta agregar cuando el commentable_type, es un usuario
    when "Comment"
      if commentable.commentable_type == "User"
        users = [commentable.commentable]
      else
        users = commentable.commentable.users
      end
      hash = { :users => users, :kind => 'user_comment_on_' + comment_type.downcase}
      return hash

    when "Delivery"
      delivery = commentable
      courses = delivery.courses

      users = []

      courses.each do |course|
        users = users.concat(course.users)
      end

      hash = {:users => users, :kind => "user_comment_on_" + comment_type.downcase}

      return hash

    else
      hash = {:users => [commentable],:kind => 'user_comment_on_' + comment_type.downcase}
      return hash
    end
  end

  def state
    @state = "published"
  end
end
