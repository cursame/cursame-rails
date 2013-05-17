task :validarusuarios => :environment do

    # alumnos = [
    #     { :first_name => 'CECILIA ', :last_name => 'ANDRES SANCHEZ', :email => 'info+013b@cursa.me',:password => 'tjlky6N00b', :group => 'Tercero B' },
    #     { :first_name => 'ARTEMIO ', :last_name => 'BECERRIL VELAZQUEZ', :email => 'info+023b@cursa.me',:password => 'R36WjwVaiZ', :group => 'Tercero B' },
    #     { :first_name => 'ARACELI ', :last_name => 'CRUZ CIRILO', :email => 'info+033b@cursa.me',:password => 'sWhD14oZGS', :group => 'Tercero B' },
    #     { :first_name => 'ARMANDO ', :last_name => 'CRUZ CIRILO', :email => 'info+043b@cursa.me',:password => 'EIeX41t7du', :group => 'Tercero B' },
    #     { :first_name => 'WILLIAM ', :last_name => 'CRUZ GONZALEZ', :email => 'info+053b@cursa.me',:password => 'yaAWCU5htt', :group => 'Tercero B' },
    #     { :first_name => 'SUHEYLI AKETZALI', :last_name => 'DE LOYOLA VIDAL', :email => 'info+063b@cursa.me',:password => '3DxzBZNDW5', :group => 'Tercero B' },
    #     { :first_name => 'YURIANAG ', :last_name => 'ENRIQUEZ BARRIOS', :email => 'info+073b@cursa.me',:password => '7nC2oCzMBk', :group => 'Tercero B' },
    #     { :first_name => 'SURIDAY ', :last_name => 'GARCIA CARDOSO', :email => 'info+083b@cursa.me',:password => 'i6N9yIRnyX', :group => 'Tercero B' },
    #     { :first_name => 'RAQUEL ', :last_name => 'GARCIA TRINIDAD', :email => 'info+093b@cursa.me',:password => 'OP0NG0kS7N', :group => 'Tercero B' },
    #     { :first_name => 'JUAN PABLO', :last_name => 'GARDUNO HERMENEGILDO', :email => 'info+103b@cursa.me',:password => '6ZyhEsbTdh', :group => 'Tercero B' },
    #     { :first_name => 'IRVING ', :last_name => 'GONZALEZ ORTA', :email => 'info+113b@cursa.me',:password => 'Snkj7TsevX', :group => 'Tercero B' },
    #     { :first_name => 'CRISTOPHER ', :last_name => 'JERONIMO QUIRINO', :email => 'info+123b@cursa.me',:password => 'ZXvUYRCNN5', :group => 'Tercero B' },
    #     { :first_name => 'JOAN TLANESI', :last_name => 'JIMENEZ GONZALEZ', :email => 'info+133b@cursa.me',:password => '46x8n5nPXo', :group => 'Tercero B' },
    #     { :first_name => 'EDUARDO ', :last_name => 'LARA SILVERIO', :email => 'info+143b@cursa.me',:password => 'nv8ZaW6yuq', :group => 'Tercero B' },
    #     { :first_name => 'AMSEL ', :last_name => 'LORENZO HERMENEGILDO', :email => 'info+153b@cursa.me',:password => 'xIS6GHmisZ', :group => 'Tercero B' },
    #     { :first_name => 'ERIC ', :last_name => 'MACARIO DOROTEO', :email => 'info+163b@cursa.me',:password => '0eF6rIWkJM', :group => 'Tercero B' },
    #     { :first_name => 'ELIZABETH ', :last_name => 'MARTINEZ GONZALEZ', :email => 'info+173b@cursa.me',:password => 'G9NafDDnnb', :group => 'Tercero B' },
    #     { :first_name => 'YOLOTZIN ', :last_name => 'NICOLAS BERNAL', :email => 'info+183b@cursa.me',:password => 'DTubbUtq2S', :group => 'Tercero B' },
    #     { :first_name => 'LUIS ALBERTO', :last_name => 'QUIRINO SANCHEZ', :email => 'info+193b@cursa.me',:password => 'b0bFZvQ6aM', :group => 'Tercero B' },
    #     { :first_name => 'BEANNY ', :last_name => 'REYES ANTONIO', :email => 'info+203b@cursa.me',:password => 'dK7FkWeVdk', :group => 'Tercero B' },
    #     { :first_name => 'CUITLAHUAC MOCTEZUMA', :last_name => 'SAMANO PERFECTO', :email => 'info+213b@cursa.me',:password => 'q5NrZ6NmH0', :group => 'Tercero B' },
    #     { :first_name => 'GUSTAVO ', :last_name => 'VENTURA REYES', :email => 'info+223b@cursa.me',:password => 'eys8w5vyQ8', :group => 'Tercero B' },
    # ]



    # alumnos.each do |item|
    #     alumno = User.find_by_email(item[:email])
    #     puts "---------------------cursos de #{alumno.name}---------------------"
    #     puts "Cursos encontrados #{alumno.courses.count}"
    #     alumno.courses.each do |course|            
    #         puts course.title
    #     end
    #     puts "------------------------------------------------------------------"
    # end 
    
    network_id = 1 # upap = 6
    maestros = Permissioning.where(:network_id => network_id, :role_id => 3)
    admins = Permissioning.where(:network_id => network_id, :role_id => 1)

    n = Network.find(6)
    
    n.courses.each do |course|
        puts "[#{course.id}]  #{course.title}"
    end

    maestros.each do |item|
        alumno = item.user
        puts "---------------------cursos de #{alumno.name}---------------------"
        puts "Cursos encontrados #{alumno.courses.count}"
        alumno.courses.each do |course|            
            puts course.title
        end
    end 
    puts "------------------------------------------------------------------"
    puts "------------------Estos son los admin-----------------------------"
    puts "------------------------------------------------------------------"
    admins.each do |item|
        admin =  item.user
        puts "---------------------cursos de #{admin.name}---------------------"
        puts "---------------------cursos de #{admin.email}---------------------"
        puts "Cursos encontrados #{admin.courses.count}"
        admin.courses.each do |course|            
            puts course.title
        end
    end
    # alumnos = [         
    #     { :first_name => 'ALINE ', :last_name => 'ALMAZAN SALAZAR', :email => 'info+011a@cursa.me',:password => '59nKukOImS', :group => 'Primero A' },
    #     { :first_name => 'NANCY ', :last_name => 'CARREOLA SANCHEZ',:email => 'info+021a@cursa.me' ,:password => 'SQOGcTnc7a', :group => 'Primero A' },
    #     { :first_name => 'JAN SAMUEL', :last_name => 'DE LA CRUZ PALOMARES',:email => 'info+031a@cursa.me' ,:password => 'Tq0W5GBMOP', :group => 'Primero A' },
    #     { :first_name => 'ANDREA LIZBETH', :last_name => 'DOROTEO DE JESUS',:email => 'info+041a@cursa.me' ,:password => 'qc0jWAVnTg', :group => 'Primero A' },
    #     { :first_name => 'JEREMY ', :last_name => 'FAUSTINO SANDOVAL',:email => 'info+051a@cursa.me' ,:password => 'Qbl7NHMd4P', :group => 'Primero A' },
    #     { :first_name => 'CHRISTIAN ', :last_name => 'GARCIA ANTONIO',:email => 'info+061a@cursa.me' ,:password => 'PUKNesZG3S', :group => 'Primero A' },
    #     { :first_name => 'CLAUDIA ', :last_name => 'GONZALEZ SANCHEZ',:email => 'info+071a@cursa.me' ,:password => 'L9FBO6xUgl', :group => 'Primero A' },
    #     { :first_name => 'FERNANDO ', :last_name => 'LARA LEON',:email => 'info+081a@cursa.me' ,:password => 'iVTFSXb5Lf', :group => 'Primero A' },
    #     { :first_name => 'YAZMIN ', :last_name => 'LOPEZ GONZALEZ',:email => 'info+091a@cursa.me' ,:password => 'xFKpx1Aqn4', :group => 'Primero A' },
    #     { :first_name => 'ERIKA LIZBETH', :last_name => 'LOPEZ TORIBIO',:email => 'info+101a@cursa.me' ,:password => 'weq8hu9Lat', :group => 'Primero A' },
    #     { :first_name => 'ANGEL ', :last_name => 'MALDONADO GARCIA',:email => 'info+111a@cursa.me' ,:password => 's3j8IvJPqk', :group => 'Primero A' },
    #     { :first_name => 'BELEN ', :last_name => 'MARTINEZ PLATA',:email => 'info+121a@cursa.me' ,:password => '8WXn4Oix1R', :group => 'Primero A' },
    #     { :first_name => 'MONSERRAT ', :last_name => 'MENDOZA LEANDRO',:email => 'info+131a@cursa.me' ,:password => 'jiHh6OtmHz', :group => 'Primero A' },
    #     { :first_name => 'MARIA FERANANDA', :last_name => 'MOLINA ALANUZA',:email => 'info+141a@cursa.me' ,:password => 'OF9dCPc9RM', :group => 'Primero A' },
    #     { :first_name => 'MOESHA ELISAMA', :last_name => 'NAVA BOJORQUEZ',:email => 'info+151a@cursa.me' ,:password => '2BbEaA9F37', :group => 'Primero A' },
    #     { :first_name => 'MONTSERRAT ', :last_name => 'REYES DIAZ',:email => 'info+161a@cursa.me' ,:password => 'QamezbO4LH', :group => 'Primero A' },
    #     { :first_name => 'ITZEL ', :last_name => 'ROMERO BECERRIL',:email => 'info+171a@cursa.me' ,:password => '7FBYQVuo7N', :group => 'Primero A' },
    #     { :first_name => 'XIMENA ', :last_name => 'SERVIN SANCHEZ',:email => 'info+181a@cursa.me' ,:password => 'slmb6rV6Jk', :group => 'Primero A' },
    #     { :first_name => 'JOSE ANGEL ', :last_name => 'VILCHIS GONZALEZ',:email => 'info+191a@cursa.me' ,:password => 's8mb8rV8Jk', :group => 'Primero A' }
    # ]

    # alumnos.each do |item|
    #     alumno = User.find_by_email(item[:email])
    #     puts "---------------------cursos de #{alumno.name}---------------------"
    #     alumno.courses.each do |course|
    #         course.to_yaml

    #     end
    #     puts "------------------------------------------------------------------"
    # end 
end