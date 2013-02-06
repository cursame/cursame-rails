class Discussion < ActiveRecord::Base 
   has_many :discussions_courses
   has_many :courses, :through => :discussions_courses
   belongs_to :network
   has_many :comments
  
  
  #comentarios para las redes
  acts_as_commentable
   
end