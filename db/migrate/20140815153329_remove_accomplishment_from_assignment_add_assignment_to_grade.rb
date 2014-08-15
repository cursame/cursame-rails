class RemoveAccomplishmentFromAssignmentAddAssignmentToGrade < ActiveRecord::Migration
  def change

  	Assignment.all.each do |assignment|
  		unless assignment.accomplishment == nil
  			Grade.create(
  				:gradable_id => assignment.id, 
  				:gradable_type => 'Assignment',
  				:score => assignment.accomplishment,
  				:user_id => assignment.user_id)
  		end
  	end

  	remove_column :assignments, :accomplishment 
  end
end
