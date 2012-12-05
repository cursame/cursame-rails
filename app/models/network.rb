class Network < ActiveRecord::Base
  has_one :network_template
  has_many :networks_users, :dependent => :destroy
  #comentarios para las redes
  acts_as_commentable
  
end
