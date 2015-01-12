FactoryGirl.define do
  factory :network do
    name 'Factory network'
    subdomain 'factory'
    population 50
    public_register true
    free true
    register_form true
    welcom_message 'Welcome'
    titles 'user: Usuario, profesor: Maestro, student: Alumno, admin: Administrador, course: Curso, courses: Cursos, friend: Amigo, friends: Amigos, comunity: Comunidad'
  end 
end
