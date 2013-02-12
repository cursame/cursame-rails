class Createroles < ActiveRecord::Migration
  def up
    Role.create( title: "admin", description: "administrador de una red" ) 
    Role.create( title: "student", description: "estudiante de una red" ) 
    Role.create( title: "teacher", description: "profesor de una red" ) 
    Role.create( title: "superadmin", description: "superadmin del sistema" ) 
    Role.create( title: "supervisor", description: "admin sin capacidad de modificacion en cosas importantes en la red" )     
  end

  def down
  end
end
