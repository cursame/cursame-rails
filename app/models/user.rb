class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :name, :id, :personal_url, :avatar, :networks_users, :coverphoto, :comments, :assets
  
  has_many :networks_users, :dependent => :destroy
  has_many :users_friends
  has_many :members_in_courses
  has_many :courses, :through => :members_in_courses
  has_many :users_surveys
  has_many :assets
  has_many :assignments

  has_many :comments
  has_many :authentications 


  # roles
  has_many :permissionings
  has_many :roles, :through => :permissionings
  
  #nested atributes for forms asets
  
  accepts_nested_attributes_for :assets
  
  #comentarios para usuarios
  acts_as_commentable

  #notificaciones usuarios
  has_many :notifications


  #avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  def name
     "#{first_name} #{last_name}".strip
  end

  #roles
  def role_symbols
    roles.map do |role|
      role.title.underscore.to_sym
    end
  end
end
