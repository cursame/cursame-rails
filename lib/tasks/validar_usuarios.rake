task :validarusuarios => :environment do

  #creamos la red
  
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
    
    maestros = Permissioning.where(:network_id => 6, :role_id => 3)

    n = Network.find(6)
    
    n.courses.each do |course|
        puts course.title
    end

    maestros.each do |item|
        alumno = item.user
        puts "---------------------cursos de #{alumno.name}---------------------"
        puts "Cursos encontrados #{alumno.courses.count}"
        alumno.courses.each do |course|            
            puts course.title
        end
        puts "------------------------------------------------------------------"
    end 
end