class Permissioning < ActiveRecord::Base
	belongs_to :user
	belongs_to :role
	belongs_to :network
	
	after_update do
	  
	  puts "se ha llamado una peticion de actualizacion de permisos"
	   
  end
  
  before_update do 
    puts "se han actualizado los permisos de manera correcta"
  end
end
