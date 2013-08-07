class AddToAllUsersTheDomain < ActiveRecord::Migration
  def up
    @u = User.update_all(:domain => "cursa.me")
  end

  def down
  end
end
