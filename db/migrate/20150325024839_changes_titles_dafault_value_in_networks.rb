class ChangesTitlesDafaultValueInNetworks < ActiveRecord::Migration
  def change
    change_column :networks, :titles, :text, default: "user: Usuario, profesor: Maestro, student: Alumno, admin: Administrador, course: Curso, courses: Cursos, friend: Amigo, friends: Amigos, comunity: Comunidad, students: Estudiantes, profesores: Profesores"
  end
end
