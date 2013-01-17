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
  has_many :compart_assets
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
    end
  end  
end
