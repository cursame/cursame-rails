class AddPastejeUsers < ActiveRecord::Migration
  def up
<<<<<<< HEAD
    puts "se crea el primer curso"
    Course.create(:title => "Sexto A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")
    User.create(:first_name => "", :last_name => "", :email => "", :password => "")
    @user = User.last
    @course = Course.last
    puts "creando estudiantes primer curso"
    Permissioning.create(:user_id => @user.id, :role_id => "2", :network_id => "1"  )
    puts "creando maestros primer curso"
    Permissioning.create(:user_id => @user.id, :role_id => "3", :network_id => "1"  )

    MembersInCourse.create(:user_id => @user.id, :course_id => @course.id, :accepted => true, :owner => false, :network_id => "1" )
    puts "se crea el segundo curso"
    Course.create(:title => "Sexto B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")
    User.create(:first_name => "", :last_name => "", :email => "", :password => "")
    MembersInCourse.create(:user_id => @user.id, :course_id => @course.id, :accepted => true, :owner => false, :network_id => "1" )
    puts "creando estudiantes segundo curso"
    Permissioning.create(:user_id => @user.id, :role_id => "2", :network_id => "1"  )
    puts "creando maestros segundo curso"
    Permissioning.create(:user_id => @user.id, :role_id => "3", :network_id => "1"  )
=======

     alumnos = [ { :first_name => 'Alan', :last_name => 'luciano Cirilo', :email => 'alan.luciano.cirilo@gmail.com', :password => '09lN7nQ0Kf', :group => 'A' },
                 { :first_name => 'Carlos', :last_name => 'Alvarez Salvador', :email => 'carlosalvarez.salvador@gmail.com', :password => 'fJFVo4bocV', :group => 'A' },
                 { :first_name => 'Brian', :last_name => 'Lopez Bacilio', :email => 'brianlp11125@gmail.com', :password => '4hlG94g1DC', :group => 'A' },
                 { :first_name => 'Tania Celeste', :last_name => 'Barrera Contreras', :email => 'taniaceleste.barrera@gmail.com', :password => 'zkvY2W6YzG', :group => 'A' },
                 { :first_name => 'Jacob', :last_name => 'Genaro Apolinar', :email => 'jacob.genaro.18@gmail.com', :password => 'gOBO5LqffY', :group => 'A' },
                 { :first_name => 'Angel', :last_name => 'Lara Clemente', :email => 'angel.clemente9@gmail.com', :password => 'aJjJI39QG0', :group => 'A' },
                 { :first_name => 'Krishna Yazaanya', :last_name => 'Contreras Ortíz', :email => 'krisya.ortiz@gmail.com', :password => '26kNZv4UTj', :group => 'A' },
                 { :first_name => 'Fredy', :last_name => 'Sánchez Mondragón', :email => 'fredy.sanchez.mondragon@gmail.com', :password => 'Yo2nYVZCtq', :group => 'A' },
                 { :first_name => 'Luis Francisco', :last_name => 'Reyes Cardoso', :email => 'luis.cadoso1@gmail.com', :password => '4hZjwcA9Nw', :group => 'A' },
                 { :first_name => 'Andrea Mayte', :last_name => 'Gonzáles Lorenzo', :email => 'mayte.gonzales.2002@gmail.com', :password => 'U65jeY6EZa', :group => 'A' },
                 { :first_name => 'Andrea', :last_name => 'Nava López', :email => 'andrea.nava.2002@gmail.com', :password => 'oHTBoMkzC8', :group => 'A' },
                 { :first_name => 'Alejandra', :last_name => 'Francisco Marcos', :email => 'alejandra.francisco.marcos@gmail.com', :password => 'ztsfreqN58', :group => 'A' },
                 { :first_name => 'Brenda Gabriela', :last_name => 'Gonzalez Cecilio', :email => 'brenda.gabriela2002@gmail.com', :password => 'VV1ApBEY3T', :group => 'A' },
                 { :first_name => 'Diego', :last_name => 'Rafael Fabian', :email => 'diego.rafael.drf@gmail.com', :password => 'eIpI9RR54R', :group => 'A' },
                 { :first_name => 'Eduardo', :last_name => 'Salinas Garduño', :email => 'eduado.salias@gmail.com', :password => 'SM7Apxwc90', :group => 'A' },
                 { :first_name => 'Paulina', :last_name => 'Alcantara Millares', :email => 'palcantaramillares@gmail.com', :password => 'KT6bz3SgxR', :group => 'A' },
                 { :first_name => 'Juan Manuel', :last_name => 'Palomero Bojorquez', :email => 'juanmanuel.bojorquez@gmail.com', :password => 'bRRdep6FKy', :group => 'A' },
                 { :first_name => 'Gabriela', :last_name => 'Hernández Martínez', :email => 'gabriela.hernandez1999@gmail.com', :password => 'BI9yOUQ4HO', :group => 'A' },
                 { :first_name => 'Danna', :last_name => 'Segundo Becerril', :email => 'danna.paola.segundo@gmail.com', :password => 'eIafgMBqz1', :group => 'A' },
                 { :first_name => 'Danna Itzel', :last_name => 'Ramirez Abraham', :email => 'dannaitzel.ramirez@gmail.com', :password => 'N8k7tGw7C9', :group => 'A' },
                 { :first_name => 'Axel David', :last_name => 'Gervacio Alberto', :email => 'axel.gervacio@gmail.com', :password => 'rYxuhU5kNt', :group => 'A' },
                 { :first_name => 'Isaac', :last_name => 'García Trinidad', :email => 'isaac.garcia.200119@gmail.com', :password => 'eMTMY4jOJn', :group => 'A' },
                 { :first_name => 'Danna Paola', :last_name => 'Nava González', :email => 'dannapaola.nava02@gmail.com', :password => 'Uc3N0jU7S7', :group => 'B' },
                 { :first_name => 'Evelin Pamela', :last_name => 'Reyes Flores', :email => 'evelinpamela.01@gmail.com', :password => 'Z5xJsA7zt9', :group => 'B' },
                 { :first_name => 'Oscar', :last_name => 'Reyes Díaz', :email => 'oscar.diaz.reyes02@gmail.com', :password => 'A7b1jFB8sv', :group => 'B' },
                 { :first_name => 'Alan Benjamin', :last_name => 'González Cardozo', :email => 'alan.gonzales.02@gmail.com', :password => 'H5uITvrhTP', :group => 'B' },
                 { :first_name => 'José Armando', :last_name => 'Sánchez Sandoval', :email => 'jose.armando.sanchez.sandoval.02@gmail.com', :password => 'Ch8gubjYGx', :group => 'B' },
                 { :first_name => 'Adolfo', :last_name => 'Contreras Calixto', :email => 'adolfo.contreras.2000@gmail.com', :password => 'JXKYSWAF5D', :group => 'B' },
                 { :first_name => 'Irving', :last_name => 'Zamorano Martínez', :email => 'irving.zamorano.02@gmail.com', :password => 'V9zGbfXOXb', :group => 'B' },
                 { :first_name => 'Elbert Axel', :last_name => 'Salinas Jiménez', :email => 'elbert.salinas.01@gmail.com', :password => 'crfEn3oloT', :group => 'B' },
                 { :first_name => 'Jesus Abel', :last_name => 'Mondragón Cruz', :email => 'jesus.mondragon.03@gmail.com', :password => '412oHOuXWH', :group => 'B' },
                 { :first_name => 'Vanessa', :last_name => 'Diego Garduño', :email => 'vanessa.diego.03@gmail.com', :password => 'nqLN2c0eLN', :group => 'B' },
                 { :first_name => 'Eduardo', :last_name => 'Sánchez Martínez', :email => 'eduardo.cholito.sanchez@gmail.com', :password => 'MUMFBPD8Rt', :group => 'B' },
                 { :first_name => 'Perla', :last_name => 'Cruz Pérez', :email => 'per.cruz.02@gmail.com', :password => 'yIb0nMpeGT', :group => 'B' },
                 { :first_name => 'Angel Rafael', :last_name => 'González Flores', :email => 'angel.rafael.gonzlez.flores@gmail.com', :password => 'c3msiPNru3', :group => 'B' },
                 { :first_name => 'Ashly', :last_name => 'Becerril Arellano', :email => 'ashly.bley.becerril@gmail.com', :password => 'Hc8OzpRHUU', :group => 'B' },
                 { :first_name => 'Efrain Franco', :last_name => 'Lorenzo Olmos', :email => 'samuel.lorenzo.07@gmail.com', :password => 'z4VbYz50RJ', :group => 'B' },
                 { :first_name => 'Ivan', :last_name => 'González Madrazo', :email => 'ivan.madrazo.01@gmail.com', :password => '2JrKfqzWIn', :group => 'B' },
                 { :first_name => 'Zue', :last_name => 'Becerril González', :email => 'zue.becerril.02@gmail.com', :password => 'Nhr9h8CjDD', :group => 'B' },
                 { :first_name => 'Alexis Alan', :last_name => 'Rafael Rocha', :email => 'alexis.rafael.01@gmail.com', :password => 'whR2dfclQ7', :group => 'B' },
                 { :first_name => 'Brenda Sarahi', :last_name => 'Soto Vázquez', :email => 'brendicz.s0t0.03@gmail.com', :password => 'VvhevA5d94', :group => 'B' },
                 { :first_name => 'Abel', :last_name => 'Martínez González', :email => 'abel.martinez.gonzalez2003@gmail.com', :password => '8jzKkMFahP', :group => 'B' },
                 { :first_name => 'Samuel', :last_name => 'Antonio Cirilo', :email => 'samuel.chamito.03@gmail.com', :password => 'QA492AHAnQ', :group => 'B' },
                 { :first_name => 'Axel Jayr', :last_name => 'López Chimal', :email => 'jayr.chimal.03@gmail.com', :password => 'vKy5reXYSr', :group => 'B' },
                 { :first_name => 'Eduardo', :last_name => 'Garduño Hermenejildo', :email => 'eduardo.garduno.03@gmail.com', :password => 'joFe1Al95I', :group => 'B' },
                 { :first_name => 'Magali', :last_name => 'García Hernández', :email => 'magali.garcia.hernandez@gmail.com', :password => 'ZrepAw9BRo', :group => 'B' },
                 { :first_name => 'Dany Itzel', :last_name => 'González Rivera', :email => 'danyitzelgr@gmail.com', :password => 'fzhqS3v3Em', :group => 'A' },
                 { :first_name => 'Alejandro', :last_name => 'Ocampo Salazar', :email => 'kadosh.ivan@gmail.com', :password => 'K6J7jP23u9', :group => 'A' } ]

     maestros = [ { :first_name => 'Mabel', :last_name => 'Cruz Sotelo', :email => 'mabelcruzsotelo82@gmail.com', :password => 'ytWrwi9t4A', :group => 'A' },
                  { :first_name => 'Norma', :last_name => 'Nava González', :email => 'nava.normis.77@gmail.com', :password => '1ZNuMNqqDn', :group => 'B' } ]

     course_sexto_a = Course.create(:title => "Sexto A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")
     course_sexto_b = Course.create(:title => "Sexto B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")

     alumnos.each do |alumno|
       user = User.create :first_name => alumno[:first_name] :last_name => alumno[:last_name], :email => alumno[:email], :password => alumno[:password]
       Permissioning.create :user_id => user.id, :role_id => '2', :network_id => '1'
       MembersInCourse.create :user_id => user.id, :course_id => ( alumno[:group] == 'A' ? course_sexto_a.id : course_sexto_b.id ), :accepted => true, :owner => false, :network_id => '1'
     end
     
     maestros.each do |maestro|
      user = User.create :first_name => maestro[:first_name] :last_name => maestro[:last_name], :email => maestro[:email], :password => maestro[:password]
      Permissioning.create :user_id => user.id, :role_id => '3', :network_id => '1'
      MembersInCourse.create :user_id => user.id, :course_id => ( maestro[:group] == 'A' ? course_sexto_a.id : course_sexto_b.id ), :accepted => true, :owner => false, :network_id => '1'
    end
              
>>>>>>> Migracion que agrega los usuarios de 6to año
  end

  def down
  end
<<<<<<< HEAD
=======
  
>>>>>>> Migracion que agrega los usuarios de 6to año
end