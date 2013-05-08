task :validarusuarios => :environment do

  #creamos la red
  
    alumnos = [         
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

    alumnos.each do |item|
        alumno = User.find_by_email(item[:email])
        puts "---------------------cursos de #{alumno.name}---------------------"
        puts "Cursos encontrados #{alumno.courses.count}"
        alumno.courses.each do |course|
            course.to_yaml
        end
        puts "------------------------------------------------------------------"
    end 
end