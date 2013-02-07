class Network < ActiveRecord::Base
  has_one :network_template
  has_many :permissionings, :dependent => :destroy
  has_many :users, :through => :permissionings
  has_many :discussions
  has_many :deliveries
  has_many :courses
  has_many :comments
  
  
  #comentarios para las redes
  acts_as_commentable
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :permissionings
  
  
  
end
