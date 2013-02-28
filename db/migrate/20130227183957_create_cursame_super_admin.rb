class CreateCursameSuperAdmin < ActiveRecord::Migration
  def up
    
    User.create(email:"info+11@cursa.me", first_name: "super", last_name: "admin", password: "cursameautonomo201330lb", personal_url: "superadmin")
      a = User.last
        Permissioning.create( user_id: a.id, role_id: "4")
  end

  def down
  end
end
