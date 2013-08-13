class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :token_authenticatable, :lockable, :timeoutable,
  :confirmable


  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation,:network,
  :authentication_token, :networks, :bios, :permissioning, :permissionings,
  :search, :permissionings_attributes, :network_id, :role_id, :user_id,
  :remember_me, :first_name, :last_name, :name, :id, :personal_url,
  :avatar, :networks_users, :coverphoto, :facebook_link,
  :twitter_link, :update, :comments, :networks, :assets,
  :settings_teacher, :friendships, :friends, :registerable, :image_avatarx,
  :image_avatarxx, :cover_photox, :confirmation_token, :locked_at,
  :tour_info,:activities, :accepted_terms, :confirmed_at, :subdomain, :domain

  # Agredas las relaciones de frienship
  has_many :friendships, :uniq => true, :dependent => :destroy
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :uniq => true, :dependent => :destroy

  # se agregan las relaciones para hijos no es necesaria esta relacion
  #has_many :p_id_to_h_ids, :uniq => true, :dependent => :destroy

  has_many :permissionings, :dependent => :destroy
  has_many :networks, :through => :permissionings
  has_many :members_in_courses, :dependent => :destroy
  # Miembros de grupos
  has_many :members_in_groups, :dependent => :destroy
  has_many :groups, :dependent => :destroy

  has_many :courses, :through => :members_in_courses
  has_many :user_surveys, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :discussions, :dependent => :destroy
  has_many :deliveries, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :survey, :dependent => :destroy
  has_many :activities#, :dependent => :destroy
  #publications/walls
  has_many :userpublicationings, :dependent => :destroy
  has_many :walls, :through => :userpublicationings

  #channels for chat
  has_many :audiences, :dependent => :destroy
  has_many :channels, :through => :audiences

  has_one :settings_teacher, :dependent => :destroy

  validates_uniqueness_of :personal_url
  validates_presence_of :personal_url
  validates_presence_of :subdomain
  validates_presence_of :domain
  # validates_format_of   :personal_url, :with => /^[\-a-z0-9]+$/
  # validates_uniqueness_of :accepted_terms

  # roles
  has_many :permissionings, :dependent => :destroy
  has_many :roles, :through => :permissionings

  #nested atributes for forms asets

  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :permissionings
  accepts_nested_attributes_for :networks

  #surveys
  #has_many :assets, :dependent => :destroy

  #comentarios para usuarios
  acts_as_commentable

  #notificaciones usuarios
  has_many :usernotificationings, :dependent => :destroy
  has_many :notifications, :through => :usernotificationings


  #avatar
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader


  after_create do
    #
    # Si el usuario tiene rol de maestro, entonces creo sus settings.
    # Solamente el estudiante no tiene asociado ese modelo.
    teacher_roles = self.permissionings.keep_if {
      |permissioning|
      permissioning.role_id != 2
    }
    if (teacher_roles.length != 0) then
      SettingsTeacher.create(:user_id => self.id, :limit_deliveries => 15, :count_deliveries => 0,
                      :limit_surveys => 15,:count_surveys => 0)
    end
  end

  def inverse_friendships
    return Friendship.where(:friend_id => self.id)
  end

  def friendships
    return Friendship.where(:user_id => self.id)
  end

 # def tutors
 #   return PIdToHId.where(:p_id => self.id)
 # end

#  def parents
  #  return PIdToHId.where(:h_id => self.id)
 # end
 
 
 after_create do 
   
   self.domain = 'cursa.me'
   self.save!
   
 end


  before_destroy do
    #antes de destruir un usuario borra las relaciones de padres

    #   self.parents.each do |parent|
    #    parent.destroy
    #   end
    # self.tutors do |parents|
    #   parents.destroy
    #  end
    #antes de destruir un usuario borra las relaciones de amigos

    assets = Asset.where(:user_id => self.id)

    assets.each do
      |asset|
      asset.destroy
    end

    self.inverse_friendships.each do |friend|
      friend.destroy
    end
    self.friendships.each do |firend|
      friend.destroy
    end

    comments = Comment.where(:user_id => self.id)

    comments.each do
      |comment|
      comment.destroy
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
    if self.subdomain.split(".").size != 1 then
      return self.subdomain.split(".").last
    end
    return self.subdomain
  end

  ################ este metodo funciona para llamar la ubicación en la linea 50 del confirmation ##########

  def ubication
    if (self.domain == "lvh.me") then
      return (self.domain + ":3000")
    end
    return self.domain
  end


  #search por nombre en usuario
  def self.search(search)
    if search
      # @searcher = find(:all, :conditions => ['(first_name || last_name) LIKE ?', "%#{search}%"])
      query = "first<_name LIKE '%"+search+"%' OR last_name LIKE '%"+search+"%' "
      where(query)
    else
      # find(:all, :order => :first_name)
      scoped
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

    return (!friendship.nil? or !inverse_friendship.nil?)
  end

  def to_s
    return self.name + " (" + self.email + ")"
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

  def import(path,network,user_admin)
    arrayErrores = Array.new
    count = 0

    CSV.foreach(path, headers: true) do |row|
      count += 1
      if !row["id"].nil? then
        user = User.find_by_id(row["id"]) || User.new
      else
        user = User.new
      end
      hash = row.to_hash
      network_id = network.id
      role_id = hash.delete("Role")

      errors = false

      if !role_id.nil? then

        role_id = role_id.downcase.strip
        role_id = 2 if role_id == "estudiante"
        role_id = 3 if role_id == "maestro"
      else
        arrayErrores.push({ :line => count,:message => "No se especifico un role"})
        errors = true
      end

      if role_id.class != Fixnum then
        arrayErrores.push({:line => count, :message => "El role esta incorrecto"})
        errors = true
      end
      user.email = hash.delete("Email")

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

      if !errors then
        begin
          user.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.errors.each do |error|
            arrayErrores.push({:line => count, :message => "Falta especificar: " + error.to_s})
          end
        end
        if !user.save then
          arrayErrores.push({:line => count, :message => "Error al guardar"})
        else
          # user.confirm!
          # user.save!
          Permissioning.create!(:role_id => role_id.to_i,:network_id => network_id.to_i, :user_id => user.id)
          # mail = Notifier.send_password(user,password)
          # mail.deliver
        end
      end
    end

    mail = Notifier.send_import_users(user_admin,arrayErrores)
    mail.deliver
    return arrayErrores

  end

  handle_asynchronously :import, :priority => 20, :run_at => Proc.new{Time.zone.now}

  def member_of?(group,another_user)
    member_in_group = MembersInGroup.find_by_user_id_and_group_id(another_user.id,group.id)
    return !member_in_group.nil?
  end

  def member_of_all_groups?(user)
    self.groups.each do |group|
      if !self.member_of?(group,user)
        return false
      end
    end
    return true
  end

  def publications
    ids = []
    self.courses.each do |c|
      ids.push(c.id)
    end

    Wall.scoped(:include => {
          :courses => :coursepublicationings,
          :users => :userpublicationings,
        },
      # :conditions => ['userpublicationings.user_id = ? OR public = ?',self.id,true])
      :conditions => ['userpublicationings.user_id = ? OR coursepublicationings.course_id in (?)',self.id,ids]).order('walls.created_at DESC')
  end

  def active!
    self.update_attributes(:locked_at => nil)
  end

  def inactive!
    self.update_attributes(:locked_at => Time.now)
  end

  def averageCalification
    members = self.members_in_courses
    average = 0.0
    members.each do
      |member|
      average += member.evaluation
    end
    size = members.size
    return average/size
  end

  def averageSurveys
    user_surveys = self.user_surveys
    size = user_surveys.size
    average = 0.0
    user_surveys.each do
      |user_survey|
      average += user_survey.result
    end
    return average/size
  end

end
