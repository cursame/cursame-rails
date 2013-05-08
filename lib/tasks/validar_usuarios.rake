task :validarusuarios => :environment do

  #creamos la red
  
    alumnos = [      
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

    alumnos.each do |item|
        alumno = User.find_by_email(item[:email])
        puts "---------------------cursos de #{alumno.name}---------------------"
        puts "Cursos encontrados #{alumno.courses.count}"
        alumno.courses.each do |course|            
            puts course.title
        end
        puts "------------------------------------------------------------------"
    end 
end