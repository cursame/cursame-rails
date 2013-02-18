class Network < ActiveRecord::Base
  has_one :network_template
  has_many :permissionings, :dependent => :destroy
  has_many :users, :through => :permissionings
  has_many :discussions
  has_many :deliveries
  has_many :courses
  has_many :comments
  #se declara la presencia y la dependencia de como deve leer el formato de subdominio asi como que el subdominio e único
  
  validates_presence_of   :name, :subdomain, :population
  validates_uniqueness_of :subdomain
  validates_format_of     :subdomain, :with => /^[\-a-z0-9]+$/i  
  
  
  
  #comentarios para las redes
  acts_as_commentable
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :permissionings

  
 
  
  
  
end
