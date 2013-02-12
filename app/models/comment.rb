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
  
  #comentarios para las redes
  acts_as_commentable

  #agregar un asset al comentario
  accepts_nested_attributes_for :compart_assets

  #para elegir el elemento que recibir a/o el comentario
  def self.get_commentable(commentable_id,commentable_type)
    #comment = self.find_by_commentable_id(commentable_id)
    commentable_type.camelize.constantize.find(commentable_id)
  end

  after_create do
    case commentable_type
      when "Network"
        # commentable.users.reject { |us| us.id == self.user.id }.each do |u|
        User.all.reject { |us| us.id == self.user.id }.each do |u|
          Notification.create :user => u, :notificator => self, :kind => 'user_comment_on_network'
        end 
        #con esto se guarda en wall
        Wall.create :user => self.user, :publication => self
      when "Course"
        commentable.users.reject { |us| us.id == self.user.id }.each do |u|
          Notification.create :user => u, :notificator => self, :kind => 'user_comment_on_course'
        end
        #con esto se guarda en wall
        Wall.create :user => self.user, :publication => self
      when "Comment"
        Wall.create :user => self.user, :publication => self
    end
  end  
end
