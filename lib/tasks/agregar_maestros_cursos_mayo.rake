task :agregar_computacion => :environment do

    network_id = 6

     alumnos1a = [         
        { :first_name => 'ALINE ', :last_name => 'ALMAZAN SALAZAR', :email => 'info+011a@cursa.me',:password => '59nKukOImS', :group => 'Primero A' },
        { :first_name => 'NANCY ', :last_name => 'CARREOLA SANCHEZ',:email => 'info+021a@cursa.me' ,:password => 'SQOGcTnc7a', :group => 'Primero A' },
        { :first_name => 'JAN SAMUEL', :last_name => 'DE LA CRUZ PALOMARES',:email => 'info+031a@cursa.me' ,:password => 'Tq0W5GBMOP', :group => 'Primero A' },
        { :first_name => 'ANDREA LIZBETH', :last_name => 'DOROTEO DE JESUS',:email => 'info+041a@cursa.me' ,:password => 'qc0jWAVnTg', :group => 'Primero A' },
        { :first_name => 'JEREMY ', :last_name => 'FAUSTINO SANDOVAL',:email => 'info+051a@cursa.me' ,:password => 'Qbl7NHMd4P', :group => 'Primero A' },
        { :first_name => 'CHRISTIAN ', :last_name => 'GARCIA ANTONIO',:email => 'info+061a@cursa.me' ,:password => 'PUKNesZG3S', :group => 'Primero A' },
        { :first_name => 'CLAUDIA ', :last_name => 'GONZALEZ SANCHEZ',:email => 'info+071a@cursa.me' ,:password => 'L9FBO6xUgl', :group => 'Primero A' },
        { :first_name => 'FERNANDO ', :last_name => 'LARA LEON',:email => 'info+081a@cursa.me' ,:password => 'iVTFSXb5Lf', :group => 'Primero A' },
        { :first_name => 'YAZMIN ', :last_name => 'LOPEZ GONZALEZ',:email => 'info+091a@cursa.me' ,:password => 'xFKpx1Aqn4', :group => 'Primero A' },
        { :first_name => 'ERIKA LIZBETH', :last_name => 'LOPEZ TORIBIO',:email => 'info+101a@cursa.me' ,:password => 'weq8hu9Lat', :group => 'Primero A' },
        { :first_name => 'ANGEL ', :last_name => 'MALDONADO GARCIA',:email => 'info+111a@cursa.me' ,:password => 's3j8IvJPqk', :group => 'Primero A' },
        { :first_name => 'BELEN ', :last_name => 'MARTINEZ PLATA',:email => 'info+121a@cursa.me' ,:password => '8WXn4Oix1R', :group => 'Primero A' },
        { :first_name => 'MONSERRAT ', :last_name => 'MENDOZA LEANDRO',:email => 'info+131a@cursa.me' ,:password => 'jiHh6OtmHz', :group => 'Primero A' },
        { :first_name => 'MARIA FERANANDA', :last_name => 'MOLINA ALANUZA',:email => 'info+141a@cursa.me' ,:password => 'OF9dCPc9RM', :group => 'Primero A' },
        { :first_name => 'MOESHA ELISAMA', :last_name => 'NAVA BOJORQUEZ',:email => 'info+151a@cursa.me' ,:password => '2BbEaA9F37', :group => 'Primero A' },
        { :first_name => 'MONTSERRAT ', :last_name => 'REYES DIAZ',:email => 'info+161a@cursa.me' ,:password => 'QamezbO4LH', :group => 'Primero A' },
        { :first_name => 'ITZEL ', :last_name => 'ROMERO BECERRIL',:email => 'info+171a@cursa.me' ,:password => '7FBYQVuo7N', :group => 'Primero A' },
        { :first_name => 'XIMENA ', :last_name => 'SERVIN SANCHEZ',:email => 'info+181a@cursa.me' ,:password => 'slmb6rV6Jk', :group => 'Primero A' },
        { :first_name => 'JOSE ANGEL ', :last_name => 'VILCHIS GONZALEZ',:email => 'info+191a@cursa.me' ,:password => 's8mb8rV8Jk', :group => 'Primero A' }
    ]
    alumnos1b = [      
        { :first_name => 'DAFNE STACEY', :last_name => 'AVENDANO FELIPE', :email => 'info+011b@cursa.me',:password => 'bnoEsSJ2Fe', :group => 'Primero B' },
        { :first_name => 'NEYDY LIZBETH', :last_name => 'BECERRIL LARA', :email => 'info+021b@cursa.me',:password => 'XLEk8928z4', :group => 'Primero B' },
        { :first_name => 'LUIS ARMANDO', :last_name => 'BERNAL CUEVAS', :email => 'info+031b@cursa.me',:password => '1mNN88wf40', :group => 'Primero B' },
        { :first_name => 'JHOANA ', :last_name => 'CLEMENTE LEOCADIO', :email => 'info+041b@cursa.me',:password => 'ObamXU9Ktr', :group => 'Primero B' },
        { :first_name => 'AARON ', :last_name => 'CRUZ GONZALEZ', :email => 'info+051b@cursa.me',:password => '0auOg1VAlj', :group => 'Primero B' },
        { :first_name => 'JUAN ANGEL', :last_name => 'DOMINGUEZ MIRANDA', :email => 'info+061b@cursa.me',:password => 'b54Kdn3iXE', :group => 'Primero B' },
        { :first_name => 'DULCE NATALIA', :last_name => 'ENRIQUEZ MACARIO', :email => 'info+071b@cursa.me',:password => 'SMEL9PlS7Y', :group => 'Primero B' },
        { :first_name => 'FABIOLA ', :last_name => 'GARDUNO LOPEZ', :email => 'info+081b@cursa.me',:password => 'UH5z7WztKh', :group => 'Primero B' },
        { :first_name => 'EDSON MAURICIO', :last_name => 'GARDUNO SEGUNDO', :email => 'info+091b@cursa.me',:password => 'WxxZCZ4fPR', :group => 'Primero B' },
        { :first_name => 'JORGE ', :last_name => 'GONZALEZ MARTINEZ', :email => 'info+101b@cursa.me',:password => 'hq40Dw2v2k', :group => 'Primero B' },
        { :first_name => 'ALONDRA ', :last_name => 'JASSO MIRANDA', :email => 'info+111b@cursa.me',:password => 'IoU0dt56BW', :group => 'Primero B' },
        { :first_name => 'MARLEN ', :last_name => 'MALDONADO MENDEZ', :email => 'info+121b@cursa.me',:password => 'x1KQajhV26', :group => 'Primero B' },
        { :first_name => 'MEZTLI DANIELA', :last_name => 'MARTINEZ ARRIAGA', :email => 'info+131b@cursa.me',:password => 'vL4XfKeY5g', :group => 'Primero B' },
        { :first_name => 'OSCAR ', :last_name => 'MARTINEZ GONZALEZ', :email => 'info+141b@cursa.me',:password => 'KX9tMm6oZu', :group => 'Primero B' },
        { :first_name => 'ALONDRA JANETH', :last_name => 'OCADIZ ALANUZA', :email => 'info+151b@cursa.me',:password => 'IyIGaVTcL8', :group => 'Primero B' },
        { :first_name => 'YESSICA ', :last_name => 'RAMIREZ GARCIA', :email => 'info+161b@cursa.me',:password => 'NScsY5i5mO', :group => 'Primero B' },
        { :first_name => 'ELIZABETH ', :last_name => 'REYES ANTONIO', :email => 'info+171b@cursa.me',:password => 'C0tHbiFl9S', :group => 'Primero B' },
        { :first_name => 'DULCE JAZMIN', :last_name => 'SALINAS LOPEZ', :email => 'info+181b@cursa.me',:password => 'UE2Ln4yNzC', :group => 'Primero B' },
        { :first_name => 'CRISTIAN ', :last_name => 'SEGUNDO SILVERIO', :email => 'info+191b@cursa.me',:password => 'XWbOWAZ0Wf', :group => 'Primero B' },
        { :first_name => 'MARISOL ', :last_name => 'VAZQUEZ DOMINGUEZ', :email => 'info+201b@cursa.me',:password => 'H71edcKNAg', :group => 'Primero B' }
    ]
    #primarias
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
                { :first_name => 'Alejandro', :last_name => 'Ocampo Salazar', :email => 'info+alenjandro23@cursa.me', :password => 'K6J7jP23u9', :group => 'A' }
            ]

    #damos de alta a Cristian Mendoza Laguna
    mageo = { :first_name => 'Cristian', :last_name => 'Mendoza Laguna', :email => 'secundariapasteje64@gmail.com', :password => 'ytWrwi9t4A' }
    user = User.create :first_name => mageo[:first_name], :last_name => mageo[:last_name], :email => mageo[:email], :password => mageo[:password], :personal_url => "#{mageo[:first_name]}#{mageo[:last_name]}".split.join
    Permissioning.create :user_id => user.id, :role_id => '1', :network_id => network_id

    puts "----------------------------alta Cristian Mendoza Laguna-----------------------------------------------"

    #agregar a Alejandra
    mageo = { :first_name => 'Alejandra', :last_name => 'Nava Sanchez', :email => 'alejandra.N.S.89@gmail.com', :password => 'ytWrwi9t4A' }
    user = User.create :first_name => mageo[:first_name], :last_name => mageo[:last_name], :email => mageo[:email], :password => mageo[:password], :personal_url => "#{mageo[:first_name]}#{mageo[:last_name]}".split.join
    Permissioning.create :user_id => user.id, :role_id => '3', :network_id => network_id
    #la agregamos a historia como maestro
    MembersInCourse.create :user_id => user.id, :course_id => 15, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => 16, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    
   
    #computacion primeros sec
    C1a = Course.create(:title => "Computacion 1A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    C1b = Course.create(:title => "Computacion 1B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => network_id)
    #computacion primarias
    C6a = Course.create(:title => "Computacion 6A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => 2)
    C6b = Course.create(:title => "Computacion 6B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :silabus => "...", :public_status => "private", :network_id => 2)

    puts "----------------------------Cursos Computacion----------------------------------------------"

    #agregar a Virginia
    mageo = { :first_name => 'Virginia', :last_name => 'Olmos Contreras', :email => 'vocsamfran@gmail.com', :password => 'ytWrwi9t4A' }
    user = User.create :first_name => mageo[:first_name], :last_name => mageo[:last_name], :email => mageo[:email], :password => mageo[:password], :personal_url => "#{mageo[:first_name]}#{mageo[:last_name]}".split.join
    Permissioning.create :user_id => user.id, :role_id => '3', :network_id => network_id
    #la agregamos a historia como maestro
    MembersInCourse.create :user_id => user.id, :course_id => C1a.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    MembersInCourse.create :user_id => user.id, :course_id => C1b.id, :accepted => true, :owner => true, :network_id => network_id, :active_status => true
    


    #dar de alta usuarios a formacion civica y etica
    alumnos1a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => FC1a.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end
    alumnos1b.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => FC1b.id, :accepted => true, :owner => false, :network_id => network_id, :active_status => true
    end

    puts "----------------------------Alumnos de computacion secundaria-----------------------------------------------"
    alumnos.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.create :user_id => user.id, :course_id => ( alumno[:group] == 'A' ? C6a.id : C6b.id ), :accepted => true, :owner => false, :network_id => '2', :active_status => true
    end
end