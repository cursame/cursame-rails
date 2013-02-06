class Network < ActiveRecord::Base
  has_one :network_template
  has_many :networks_users, :dependent => :destroy
  has_many :users, :through => :networks_users
  has_many :discussions
  has_many :deliveries
  has_many :courses
  has_many :comments
  
  
  #comentarios para las redes
  acts_as_commentable
  
end
