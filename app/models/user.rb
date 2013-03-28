class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :token_authenticatable, :confirmable, :lockable, :timeoutable


  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation,:network,:authentication_token,
  :networks, :bios, :permissioning, :permissionings, :search,
  :permissionings_attributes, :network_id, :role_id, :user_id,
  :remember_me, :first_name, :last_name, :name, :id, :personal_url,
  :avatar, :networks_users, :coverphoto, :facebook_link,
  :twitter_link, :update, :comments, :networks, :assets,
  :settings_teacher, :friendships, :friends, :registerable, :image_avatarx, :image_avatarxx, :cover_photox

  # Agredas las relaciones de frienship
  has_many :friendships, :uniq => true
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :uniq => true


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
  has_many :walls, :dependent => :destroy


  has_one :settings_teacher, :dependent => :destroy

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


  after_create do
    #
    # Si el usuario tiene rol de maestro, entonces creo sus settings.
    # Solamente el estudiante no tiene asociado ese modelo.
    teacher_roles = self.permissionings.keep_if{
      |permissioning|
      permissioning.role_id != 2
    }
    if (teacher_roles.length != 0) then
      SettingsTeacher.create(:user_id => self.id, :limit_deliveries => 15, :count_deliveries => 0,
                      :limit_surveys => 15,:count_surveys => 0)
    end
  end

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

  def image_avatarx
     'imagex.png'
  end

  def image_avatarxx
    'imagexx.png'
  end
  
  def image_avatarxxx
     'imagexxx.png'
   end

  def cover_photox
    'portada.png'
  end


  # search all friends accepted or not accepted
  def friends(accepted)
    friendships = self.friendships.keep_if {
      |friendship|
      friendship.accepted == accepted
    }

    friends = friendships.map {
      |friendship|
      friendship.friend
    }

    another_friendships = self.inverse_friendships.keep_if {
      |inverse_friendship|
      inverse_friendship.accepted == accepted
    }

    inverse_friends = another_friendships.map {
      |friendship|
      friendship.user
    }

    ordered_friends = (friends + inverse_friends).sort {
      |x,y|
      x.to_s <=> y.to_s
    }
    return ordered_friends
  end

  def all_friends
    friendships = self.friendships
    friendships_inverse = self.inverse_friendships

    friends = friendships.map {
      |friendship|
      hash = Hash.new
      hash[:user] = friendship.friend
      hash[:accepted] = friendship.accepted
      hash
    }

    inverse_friends = friendships_inverse.map {
      |friendship|
      hash = Hash.new
      hash[:user] = friendship.user
      hash[:accepted] = friendship.accepted
      hash
    }

    friends = friends.keep_if {
      |friendship|
      friendship[:accepted]
    }
    ordered_friends = (friends + inverse_friends).sort {
      |x,y|
      x[:user].to_s <=> y[:user].to_s
    }
    return ordered_friends
  end

  def mutual_friends(other_user)
    friends = self.friends(true)
    other_friends = other_user.friends(true)
    return friends | other_friends
  end

  def friends?(another_user)
    if self.id == another_user.id then
      return true
    end
    friendship = Friendship.find_by_user_id_and_friend_id(self.id, another_user.id)
    inverse_friendship = Friendship.find_by_user_id_and_friend_id(another_user.id, self.id)

    if friendship.nil? && inverse_friendship.nil? then
      return false
    end

    if !friendship.nil? then
      return friendship.accepted
    end

    if !inverse_friendship.nil? then
      return inverse_friendship.accepted
    end
  end

  def friends_request?(another_user)
    if self.id == another_user.id then
      return true
    end

    friendship = Friendship.find_by_user_id_and_friend_id(self.id, another_user.id)
    inverse_friendship = Friendship.find_by_user_id_and_friend_id(another_user.id,self.id)

    return !friendship.nil? || !inverse_friendship.nil?
  end

  def to_s
    return self.name + " (" + self.email + ")"
  end

  def possible_friends
    users = Array.new
    self.networks.each do
      |network|
        network.users.each do
        |user|
        if !self.friends_request?(user) then
          users.push(user)
        end
      end
    end
    return users.uniq
  end
end
