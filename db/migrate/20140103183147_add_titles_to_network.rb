class AddTitlesToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :titles, :text, :default => "user: Usuario, profesor: Maestro, student: Alumno, admin: Administrador, course: Curso, courses: Cursos, friend: Amigo, friends: Amigos, comunity: Comunidad"

  end
end
