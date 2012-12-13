class Bassicpermission < ActiveRecord::Migration
  def up
    BasicPermiission.create(:title => "create")
    BasicPermiission.create(:title => "edit")
    BasicPermiission.create(:title => "update")
    BasicPermiission.create(:title => "show")
    BasicPermiission.create(:title => "insert")
    BasicPermiission.create(:title => "suspend")
    BasicPermiission.create(:title => "destoy")
    
    
  end

  def down
  end
end
