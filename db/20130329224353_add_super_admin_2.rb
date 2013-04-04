class AddSuperAdmin2 < ActiveRecord::Migration
  def up
      Role.create( title: "admin", description: "administrador de una red" ) 
      Role.create( title: "student", description: "estudiante de una red" ) 
      Role.create( title: "teacher", description: "profesor de una red" ) 
      Role.create( title: "superadmin", description: "superadmin del sistema" ) 
      Role.create( title: "supervisor", description: "admin sin capacidad de modificacion en cosas importantes en la red" )

     User.create(email:"info@cursa.me", first_name: "super", last_name: "admin", password: "cursameautonomo201330lb", personal_url: "superadmin")
          a = User.last
          Permissioning.create( user_id: a.id, role_id: "4")

   end

   def down
   end
end
