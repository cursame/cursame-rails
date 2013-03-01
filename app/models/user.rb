class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :token_authenticatable, :confirmable, :lockable, :timeoutable
   

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:network, :networks, :bios, :permissioning, :permissionings, :search,:permissionings_attributes, :network_id, :role_id, :user_id ,:remember_me, :first_name, :last_name, :name, :id, :personal_url, :avatar, :networks_users, :coverphoto, :facebook_link, :twitter_link, :update, :comments, :networks, :assets
  
  has_many :permissionings, :dependent => :destroy
  has_many :networks, :through => :permissionings
  has_many :users_friends, :dependent => :destroy
  has_many :members_in_courses, :dependent => :destroy
  has_many :courses, :through => :members_in_courses
  has_many :users_surveys, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :deliveries, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :friendships, :dependent => :destroy
  has_many :survey, :dependent => :destroy

  
  
  
  #validates :password,:presence=>true,:on=>:create
  validates_uniqueness_of :personal_url

  # roles
  has_many :permissionings
  has_many :roles, :through => :permissionings
  
  #nested atributes for forms asets
  
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :permissionings
  accepts_nested_attributes_for :networks
  
  #surveys
  has_many :assets
  
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
  
  #mailer for subdominea_save 
  
  def devise_mailer_subdomain
     if @permissionings != nil
     @permissionings = self.permissionings.last
     @network = Network.find(@permissionings.network_id)
     else
       @network = Network.last
       
     end
     @network.subdomain   
  end
  

  
  #search por nombre en usuario
  def self.search(search) 
    if search
      @searcher = find(:all, :conditions => ['(first_name || last_name) LIKE ?', "%#{search}%"])        
    else
      find(:all, :order => :first_name)
    end
  end

end
