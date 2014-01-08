class AddAuthenticateTeacherToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :authenticate_teacher, :boolean

  end
end
