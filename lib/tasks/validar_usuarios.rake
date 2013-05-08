task :validarusuarios => :environment do

  #creamos la red
  
    alumnos = [      
        { :first_name => 'MARIA DE LA LUZ', :last_name => 'ALBERTO SERRANO',:email => 'info+012b@cursa.me', :password => 'PRgM0xgKa1', :group => 'Segundo B' },
        { :first_name => 'JAQUELINE ', :last_name => 'BARRIOS DOMINGUEZ',:email => 'info+022b@cursa.me', :password => 'WOi8VpvmVX', :group => 'Segundo B' },
        { :first_name => 'ANA CRISTAL', :last_name => 'CRUZ MENDOZA',:email => 'info+032b@cursa.me', :password => 'Zgr2qow6sR', :group => 'Segundo B' },
        { :first_name => 'MARIA FERNANDA', :last_name => 'ENRIQUEZ SANTANA',:email => 'info+042b@cursa.me', :password => 'jH8xen3j9K', :group => 'Segundo B' },
        { :first_name => 'JOSE DE JESUS ', :last_name => 'FELIPE MORENO',:email => 'info+052b@cursa.me', :password => '7kPJ9qxuxo', :group => 'Segundo B' },
        { :first_name => 'NEREIDA ', :last_name => 'FRANCISCO SOTELO',:email => 'info+062b@cursa.me', :password => 'TVe9RAuF91', :group => 'Segundo B' },
        { :first_name => 'DANIELA ', :last_name => 'GARCIA ANTONIO',:email => 'info+072b@cursa.me', :password => 'Pm7VBlPFrq', :group => 'Segundo B' },
        { :first_name => 'BRENDA ', :last_name => 'GARCIA HERNANDEZ',:email => 'info+082b@cursa.me', :password => 'tfaRl9xOxz', :group => 'Segundo B' },
        { :first_name => 'ANGEL GAEL', :last_name => 'GENARO REYES',:email => 'info+092b@cursa.me', :password => 'mEsQk29dDy', :group => 'Segundo B' },
        { :first_name => 'MARIA CARLOTA', :last_name => 'GONZALEZ LORENZO',:email => 'info+102b@cursa.me', :password => '7ovLVxBv1Z', :group => 'Segundo B' },
        { :first_name => 'ANAQUETZALINI ', :last_name => 'GUADALUPE VAZQUEZ',:email => 'info+112b@cursa.me', :password => 'QJYAuP2lgP', :group => 'Segundo B' },
        { :first_name => 'PATSY ROSARIO', :last_name => 'LEON GIL',:email => 'info+122b@cursa.me', :password => 'jCd3vxwcu6', :group => 'Segundo B' },
        { :first_name => 'JOANA USURIZ', :last_name => 'LOPEZ FLORES',:email => 'info+132b@cursa.me', :password => '9jREZiBXQz', :group => 'Segundo B' },
        { :first_name => 'AARON ', :last_name => 'LORENZO DOROTEO',:email => 'info+142b@cursa.me', :password => 'tlsX0DhVOI', :group => 'Segundo B' },
        { :first_name => 'EDUARDO ', :last_name => 'MONROY JIMENEZ',:email => 'info+152b@cursa.me', :password => 'LJveetf0pm', :group => 'Segundo B' },
        { :first_name => 'ANDREA ', :last_name => 'MONTENEGRO PEREZ',:email => 'info+162b@cursa.me', :password => 'Vobad6jBai', :group => 'Segundo B' },
        { :first_name => 'ADELA ', :last_name => 'NAVA MARTINEZ',:email => 'info+172b@cursa.me', :password => 'JBkfkTN4yA', :group => 'Segundo B' },
        { :first_name => 'JAQUELINE ', :last_name => 'ORTEGA VAZQUEZ',:email => 'info+182b@cursa.me', :password => 'h1RMy9Gy6m', :group => 'Segundo B' },
        { :first_name => 'BRYANT ', :last_name => 'RAMIREZ VELAZQUEZ',:email => 'info+192b@cursa.me', :password => 'Hb9luD0mRH', :group => 'Segundo B' },
        { :first_name => 'HEIDY ', :last_name => 'SALINAS MARTINEZ',:email => 'info+202b@cursa.me', :password => 'qEkY5tbnHn', :group => 'Segundo B' },
        { :first_name => 'ANDREA BRYTANI', :last_name => 'VELASCO MORALES',:email => 'info+212b@cursa.me', :password => 'a6pUKQELC4', :group => 'Segundo B' }
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