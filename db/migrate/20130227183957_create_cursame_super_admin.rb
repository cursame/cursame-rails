class CreateCursameSuperAdmin < ActiveRecord::Migration
  def up
    a = User.new(email:"info@cursa.me", first_name: "super", last_name: "admin", password: "cursameautonomo201330lb", personal_url: "superadmin")
    a.skip_confirmation!
    a.save!
    Permissioning.create!( user_id: a.id, role_id: "4")
  end

  def down
  end
end
