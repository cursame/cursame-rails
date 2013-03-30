class AddPastejeUserForCursatest < ActiveRecord::Migration
  def up

    alumnos = [ { :first_name => 'Alan', :last_name => 'luciano Cirilo', :email => 'info+alan@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' },
                { :first_name => 'Carlos', :last_name => 'Alvarez Salvador', :email => 'info+carlos@cursa.me', :password => 'fJFVo4bocV', :group => 'A' },
                { :first_name => 'Brian', :last_name => 'Lopez Bacilio', :email => 'info+brian@cursa.me', :password => '4hlG94g1DC', :group => 'A' },
                { :first_name => 'Tania Celeste', :last_name => 'Barrera Contreras', :email => 'info+tania@cursa.me', :password => 'zkvY2W6YzG', :group => 'A' },
                { :first_name => 'Jacob', :last_name => 'Genaro Apolinar', :email => 'info+jacob@cursa.me', :password => 'gOBO5LqffY', :group => 'A' },
                { :first_name => 'Angel', :last_name => 'Lara Clemente', :email => 'info+angel@cursa.me', :password => 'aJjJI39QG0', :group => 'A' },
                { :first_name => 'Krishna Yazaanya', :last_name => 'Contreras Ortiz', :email => 'info+krishna@cursa.me', :password => '26kNZv4UTj', :group => 'A' },
                { :first_name => 'Fredy', :last_name => 'Sanchez Mondragon', :email => 'info+fredy@cursa.me', :password => 'Yo2nYVZCtq', :group => 'A' },
                { :first_name => 'Luis Francisco', :last_name => 'Reyes Cardoso', :email => 'info+luis@cursa.me', :password => '4hZjwcA9Nw', :group => 'A' },
                { :first_name => 'Andrea Mayte', :last_name => 'Gonzales Lorenzo', :email => 'info+andreamayte@cursa.me', :password => 'U65jeY6EZa', :group => 'A' },
                { :first_name => 'Andrea', :last_name => 'Nava Lopez', :email => 'info+andrea@cursa.me', :password => 'oHTBoMkzC8', :group => 'A' },
                { :first_name => 'Alejandra', :last_name => 'Francisco Marcos', :email => 'info+alejandra@cursa.me', :password => 'ztsfreqN58', :group => 'A' },
                { :first_name => 'Brenda Gabriela', :last_name => 'Gonzalez Cecilio', :email => 'info+brendagabriela@cursa.me', :password => 'VV1ApBEY3T', :group => 'A' },
                { :first_name => 'Diego', :last_name => 'Rafael Fabian', :email => 'info+diego@cursa.me', :password => 'eIpI9RR54R', :group => 'A' },
                { :first_name => 'Eduardo', :last_name => 'Salinas Garduno', :email => 'info+eduardo1@cursa.me', :password => 'SM7Apxwc90', :group => 'A' },
                { :first_name => 'Paulina', :last_name => 'Alcantara Millares', :email => 'info+paulina1@cursa.me', :password => 'KT6bz3SgxR', :group => 'A' },
                { :first_name => 'Juan Manuel', :last_name => 'Palomero Bojorquez', :email => 'info+juanmanuel1@cursa.me', :password => 'bRRdep6FKy', :group => 'A' },
                { :first_name => 'Gabriela', :last_name => 'Hernandez Martinez', :email => 'info+gabriela1@cursa.me', :password => 'BI9yOUQ4HO', :group => 'A' },
                { :first_name => 'Danna', :last_name => 'Segundo Becerril', :email => 'danna.paola.segundo@gmail.com', :password => 'eIafgMBqz1', :group => 'A' },
                { :first_name => 'Danna Itzel', :last_name => 'Ramirez Abraham', :email => 'info+danna1@cursa.me', :password => 'N8k7tGw7C9', :group => 'A' },
                { :first_name => 'Axel David', :last_name => 'Gervacio Alberto', :email => 'info+axeldavid@cursa.me', :password => 'rYxuhU5kNt', :group => 'A' },
                { :first_name => 'Isaac', :last_name => 'Garcia Trinidad', :email => 'info+isaac1@cursa.me', :password => 'eMTMY4jOJn', :group => 'A' },
                { :first_name => 'Danna Paola', :last_name => 'Nava Gonzalez', :email => 'info+danapaola1@cursa.me', :password => 'Uc3N0jU7S7', :group => 'B' },
                { :first_name => 'Evelin Pamela', :last_name => 'Reyes Flores', :email => 'info+evelingpamela1@cursa.me', :password => 'Z5xJsA7zt9', :group => 'B' },
                { :first_name => 'Oscar', :last_name => 'Reyes Diaz', :email => 'info+oscar2@cursa.me', :password => 'A7b1jFB8sv', :group => 'B' },
                { :first_name => 'Alan Benjamin', :last_name => 'Gonzalez Cardozo', :email => 'info+alanbenjamin1@cursa.me', :password => 'H5uITvrhTP', :group => 'B' },
                { :first_name => 'Jose Armando', :last_name => 'Sanchez Sandoval', :email => 'info+josearmando1@cursa.me', :password => 'Ch8gubjYGx', :group => 'B' },
                { :first_name => 'Adolfo', :last_name => 'Contreras Calixto', :email => 'info+adolfo1@cursa.me', :password => 'JXKYSWAF5D', :group => 'B' },
                { :first_name => 'Irving', :last_name => 'Zamorano Martinez', :email => 'info+irving1@cursa.me', :password => 'V9zGbfXOXb', :group => 'B' },
                { :first_name => 'Elbert Axel', :last_name => 'Salinas Jimenez', :email => 'info+elvertsalinas@cursa.me', :password => 'crfEn3oloT', :group => 'B' },
                { :first_name => 'Jesus Abel', :last_name => 'Mondragon Cruz', :email => 'info+jesusabel1@cursa.me', :password => '412oHOuXWH', :group => 'B' },
                { :first_name => 'Vanessa', :last_name => 'Diego Garduno', :email => 'info+vanessa1@cursa.me', :password => 'nqLN2c0eLN', :group => 'B' },
                { :first_name => 'Eduardo', :last_name => 'Sanchez Martinez', :email => 'info+eduardo2@cursa.me', :password => 'MUMFBPD8Rt', :group => 'B' },
                { :first_name => 'Perla', :last_name => 'Cruz Perez', :email => 'info+perla1@cursa.me', :password => 'yIb0nMpeGT', :group => 'B' },
                { :first_name => 'Angel Rafael', :last_name => 'Gonzalez Flores', :email => 'info+angelrafael1@cursa.me', :password => 'c3msiPNru3', :group => 'B' },
                { :first_name => 'Ashly', :last_name => 'Becerril Arellano', :email => 'info+ashly1@cursa.me', :password => 'Hc8OzpRHUU', :group => 'B' },
                { :first_name => 'Efrain Franco', :last_name => 'Lorenzo Olmos', :email => 'info+efrainfranco1@cursa.me', :password => 'z4VbYz50RJ', :group => 'B' },
                { :first_name => 'Ivan', :last_name => 'Gonzalez Madrazo', :email => 'info+ivan2@cursa.me', :password => '2JrKfqzWIn', :group => 'B' },
                { :first_name => 'Zue', :last_name => 'Becerril Gonzalez', :email => 'info+zue@cursa.me', :password => 'Nhr9h8CjDD', :group => 'B' },
                { :first_name => 'Alexis Alan', :last_name => 'Rafael Rocha', :email => 'info+alexisalan5@cursa.me', :password => 'whR2dfclQ7', :group => 'B' },
                { :first_name => 'Brenda Sarahi', :last_name => 'Soto Vazquez', :email => 'info+brenda4@cursa.me', :password => 'VvhevA5d94', :group => 'B' },
                { :first_name => 'Abel', :last_name => 'Martinez Gonzalez', :email => 'info+abel11@cursa.me', :password => '8jzKkMFahP', :group => 'B' },
                { :first_name => 'Samuel', :last_name => 'Antonio Cirilo', :email => 'info+samuel10@cursa.me', :password => 'QA492AHAnQ', :group => 'B' },
                { :first_name => 'Axel Jayr', :last_name => 'Lopez Chimal', :email => 'info+axel56@cursa.me', :password => 'vKy5reXYSr', :group => 'B' },
                { :first_name => 'Eduardo', :last_name => 'Garduno Hermenejildo', :email => 'info+eduardo111@cursa.me', :password => 'joFe1Al95I', :group => 'B' },
                { :first_name => 'Magali', :last_name => 'Garcia Hernandez', :email => 'info+magali43@cursa.me', :password => 'ZrepAw9BRo', :group => 'B' },
                { :first_name => 'Dany Itzel', :last_name => 'Gonzalez Rivera', :email => 'info+dany99@cursa.me', :password => 'fzhqS3v3Em', :group => 'A' },
                { :first_name => 'Alejandro', :last_name => 'Ocampo Salazar', :email => 'info+alenjandro23@cursa.me', :password => 'K6J7jP23u9', :group => 'A' } ]

    maestros = [ { :first_name => 'Mabel', :last_name => 'Cruz Sotelo', :email => 'info+mabel09@cursa.me', :password => 'ytWrwi9t4A', :group => 'A' },
                 { :first_name => 'Norma', :last_name => 'Nava Gonzalez', :email => 'info+norma10@cursa.me', :password => '1ZNuMNqqDn', :group => 'B' } ]

    course_sexto_a = Course.create(:title => "Sexto A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private", :network_id => "2")
    course_sexto_b = Course.create(:title => "Sexto B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private", :network_id => "2")

    maestros.each do |maestro|
       user = User.create :first_name => maestro[:first_name], :last_name => maestro[:last_name], :email => maestro[:email], :password => maestro[:password], :personal_url => "#{maestro[:first_name]}#{maestro[:last_name]}".split.join
       Permissioning.create :user_id => user.id, :role_id => '3', :network_id => '2'
       MembersInCourse.create :user_id => user.id, :course_id => ( maestro[:group] == 'A' ? course_sexto_a.id : course_sexto_b.id ), :accepted => true, :owner => true, :network_id => '2', :active_status => true
    end

    alumnos.each do |alumno|
      user = User.create :first_name => alumno[:first_name], :last_name => alumno[:last_name], :email => alumno[:email], :password => alumno[:password], :personal_url => "#{alumno[:first_name]}#{alumno[:last_name]}".split.join
      Permissioning.create :user_id => user.id, :role_id => '2', :network_id => '2'
      MembersInCourse.create :user_id => user.id, :course_id => ( alumno[:group] == 'A' ? course_sexto_a.id : course_sexto_b.id ), :accepted => true, :owner => false, :network_id => '2', :active_status => true
    end
     
     MembersInCourse.create :user_id => "4", :course_id => "3", :accepted => true, :owner => true, :network_id => '2', :active_status => true
     MembersInCourse.create :user_id => "4", :course_id => "4", :accepted => true, :owner => true, :network_id => '2', :active_status => true
     
       
   end
end
