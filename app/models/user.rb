class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :name, :id
  
  has_many :networks_users, :dependent => :destroy
  #comentarios para usuarios
  acts_as_commentable
  
  def name
     "#{first_name} #{last_name}".strip
  end
end
