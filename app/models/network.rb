class Network < ActiveRecord::Base
  has_one :network_template#, :dependent => :destroy
  has_many :permissionings, :dependent => :destroy
  has_many :users, :through => :permissionings
  has_many :discussions, :dependent => :destroy
  has_many :deliveries#, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :surveys#, :dependent => :destroy
  #walls
  has_many :walls, :dependent => :destroy
  #library
  # Error por que la variable no fue inicializada al usar destroy
  has_many :libraries#, :dependent => :destroy
  #se declara la presencia y la dependencia de como deve leer el formato de subdominio asi como que el subdominio e único

  validates_presence_of   :name, :subdomain, :population
  validates_uniqueness_of :subdomain
  validates_format_of     :subdomain, :with => /^[\-a-z0-9]+$/



  #comentarios para las redes
  acts_as_commentable

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :permissionings
  
  def owner?(role,user)
    return false
  end

  def publications (user_id)
    Wall.scoped(:include => {
          :users => :userpublicationings,
        },
      :conditions => ['userpublicationings.user_id = ? OR walls.public = ?',user_id,true]).order('walls.created_at DESC')
  end


end
