#Se eliminan todas las publicaciones que se crearon al comentar cursos

task :delete_walls_of_course_comments => :environment do
  comments = Comment.where(:commentable_type => "Course")
  comments.each do |c|
  walls = Wall.where(:publication_id => c.id, :publication_type => "Comment")
  walls.destroy_all
  end
end