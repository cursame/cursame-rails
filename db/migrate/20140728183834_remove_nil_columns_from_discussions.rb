# INFO: migracion de mantenimiento
# TODO: eliminar despues de pasar a produccion
class RemoveNilColumnsFromDiscussions < ActiveRecord::Migration
  def change
  	Course.where(init_date: nil).each do |course|
  	  course.update_attribute :init_date, course.created_at
  	end
  	Course.where(finish_date: nil).each do |course|
  	  course.update_attribute :finish_date, DateTime.now
  	end
  end
end
