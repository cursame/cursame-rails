task :edicion_usuarios_mayo => :environment do


alumnos2a = [      
    { :first_name => 'BRANDON ', :last_name => 'ANTONIO CIRILO', :email => 'info+012a@cursa.me',:password => 'QVS4q0ZQwj', :group => 'Segundo A' },
    { :first_name => 'MARIA DE LOS ANGELES', :last_name => 'BARRIOS JASSO', :email => 'info+022a@cursa.me',:password => 'csEcLJ1jr2', :group => 'Segundo A' },
    { :first_name => 'MARIA FERNANDA', :last_name => 'CADENA FLORES', :email => 'info+032a@cursa.me',:password => 'zQROo1DZHA', :group => 'Segundo A' },
    { :first_name => 'MONCERATH ', :last_name => 'DE JESUS LAZARO', :email => 'info+042a@cursa.me',:password => 'cbGc0PyEWH', :group => 'Segundo A' },
    { :first_name => 'BRENDA JAQUELINE', :last_name => 'DE JESUS LOPEZ', :email => 'info+052a@cursa.me',:password => 'oH1d68SsXw', :group => 'Segundo A' },
    { :first_name => 'JOSE DE JESUS ', :last_name => 'ENRIQUEZ BARRIOS', :email => 'info+062a@cursa.me',:password => 'fnE1LJARMU', :group => 'Segundo A' },
    { :first_name => 'REBECA ', :last_name => 'GENARO APOLINAR', :email => 'info+072a@cursa.me',:password => 'RLSvR7Z59C', :group => 'Segundo A' },
    { :first_name => 'YARET ', :last_name => 'GONZALEZ RIVERA', :email => 'info+082a@cursa.me',:password => 'BZX78lwwKO', :group => 'Segundo A' },
    { :first_name => 'MARIA FERNANDA', :last_name => 'GUZMAN BLAS', :email => 'info+092a@cursa.me',:password => 'u1KX0c6ngq', :group => 'Segundo A' },
    { :first_name => 'JASMIN ', :last_name => 'HUERTA LARA', :email => 'info+102a@cursa.me',:password => 'mq8C9XlMJy', :group => 'Segundo A' },
    { :first_name => 'FELIPE JESUS', :last_name => 'JERONIMO FLORES', :email => 'info+112a@cursa.me',:password => 'svoFQ9fvMo', :group => 'Segundo A' },
    { :first_name => 'XEARI MILTHON', :last_name => 'LAZARO GONZALEZ', :email => 'info+122a@cursa.me',:password => '4FIDecMhGC', :group => 'Segundo A' },
    { :first_name => 'MIREYA ', :last_name => 'LOPEZ GONZALEZ', :email => 'info+132a@cursa.me',:password => '2Q7hudzNBQ', :group => 'Segundo A' },
    { :first_name => 'LESLIE ', :last_name => 'LUCIANO CIRILO', :email => 'info+142a@cursa.me',:password => 'Ofq1zrc31m', :group => 'Segundo A' },
    { :first_name => 'ARELI ', :last_name => 'MARTINEZ HERNANDEZ', :email => 'info+152a@cursa.me',:password => 'Qysa8mbhro', :group => 'Segundo A' },
    { :first_name => 'PAOLA ', :last_name => 'MARINEZ ONOFRE', :email => 'info+162a@cursa.me',:password => '0YgNxZ4KzK', :group => 'Segundo A' },
    { :first_name => 'SAMUEL ', :last_name => 'RAMIREZ DOMINGUEZ', :email => 'info+172a@cursa.me',:password => '9pdV4UHM00', :group => 'Segundo A' },
    { :first_name => 'SHARON ', :last_name => 'RAMIREZ MENDOZA', :email => 'info+182a@cursa.me',:password => 'bne3g2iIhp', :group => 'Segundo A' },
    { :first_name => 'ERICA ', :last_name => 'VICTORIANO PATRICIO', :email => 'info+192a@cursa.me',:password => 'mkrz7B9AcT', :group => 'Segundo A' }
]

  @course = Course.find_by_title('Taller de matematicas 2A')
  if @course == nil
    puts "curso vacio"
  else
    @members_destroy = @course.members_in_courses.where(:owner => false)
    @members_destroy.each do |ml|
      ml.destroy
      puts "usuario eliminado del curso 2A  #{ml.course_id} "
    end

          alumnos2a.each do |inscript|
            @cg =  User.find_by_email(inscript[:email])
            if @cg == nil
              puts 'nil'
            else
              MembersInCourse.create(:course_id => @course.id, :user_id => @cg.id, :owner => false, :accepted => true)  
            end
          end
  end
  @user_owner_edit_members_in_course = User.find_by_email('info+juan@cursa.me')
    if @user_owner_edit_members_in_course == nil
      puts "sin usuario"
    else
      
      @users_mk_destroy = @user_owner_edit_members_in_course.members_in_courses
      @users_mk_destroy.each do |lo|
       lo.destroy
       puts "se han eliminado las pertenencias en el curso para  info+juan@cursa.me  #{lo.course_id}"
       
      end
    end
end