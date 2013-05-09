task :validarusuarios => :environment do

  #creamos la red
  
    alumnos = [     
        { :first_name => 'ANDREA ', :last_name => 'ALCANTARA MILLARES', :email => 'info+013a@cursa.me',:password => '0tcpFL6AfH', :group => 'Tercero A' },
        { :first_name => 'JUAN MANUEL', :last_name => 'ALCANTARA MILLARES', :email => 'info+023a@cursa.me',:password => 'uKXAdg3ZXM', :group => 'Tercero A' },
        { :first_name => 'GUILLERMO ENRIQUE', :last_name => 'CARMONA BECERRIL', :email => 'info+033a@cursa.me',:password => 'soeKwOe1Zy', :group => 'Tercero A' },
        { :first_name => 'ABRIL ', :last_name => 'CIRILO GARCIA', :email => 'info+043a@cursa.me',:password => '6KmIYIArAO', :group => 'Tercero A' },
        { :first_name => 'YAHAIRA HAYDEE', :last_name => 'CONTRERAS ORTIZ', :email => 'info+053a@cursa.me',:password => '1Y05tkG9UC', :group => 'Tercero A' },
        { :first_name => 'ALONDRA ', :last_name => 'DIEGO GARDUNO', :email => 'info+063a@cursa.me',:password => 'a8KMqRz7k4', :group => 'Tercero A' },
        { :first_name => 'SERGIO ', :last_name => 'DOMINGUEZ SANCHEZ', :email => 'info+073a@cursa.me',:password => 'eSMcZ83jyz', :group => 'Tercero A' },
        { :first_name => 'ANDRES ', :last_name => 'EPIGMENIO GARCIA', :email => 'info+083a@cursa.me',:password => 'mhF95jLPwZ', :group => 'Tercero A' },
        { :first_name => 'YOANA ', :last_name => 'FAUSTINO HERNANDEZ', :email => 'info+093a@cursa.me',:password => 'G7L52ZQUeO', :group => 'Tercero A' },
        { :first_name => 'CESAR ', :last_name => 'FLORES REYES', :email => 'info+103a@cursa.me',:password => 'XFPkjBtYL5', :group => 'Tercero A' },
        { :first_name => 'NORMA LAURA', :last_name => 'GARCIA CONTRERAS', :email => 'info+113a@cursa.me',:password => 'ssh6jkcbpP', :group => 'Tercero A' },
        { :first_name => 'KATIA ', :last_name => 'GONZALEZ MADRAZO', :email => 'info+123a@cursa.me',:password => 'K5mD42suwD', :group => 'Tercero A' },
        { :first_name => 'ERIKA ', :last_name => 'HUERTA LARA', :email => 'info+133a@cursa.me',:password => 'Zd1hoi4VaJ', :group => 'Tercero A' },
        { :first_name => 'RODRIGO ', :last_name => 'LAZARO DOMINGUEZ', :email => 'info+143a@cursa.me',:password => 'yW3VekqUwu', :group => 'Tercero A' },
        { :first_name => 'ALVARO YOEL', :last_name => 'LORENZO VAZQUEZ', :email => 'info+153a@cursa.me',:password => 'bCeaLvuc9Q', :group => 'Tercero A' },
        { :first_name => 'IVAN ', :last_name => 'MALDONADO GOMEZ', :email => 'info+163a@cursa.me',:password => 'G1NTqy5XK0', :group => 'Tercero A' },
        { :first_name => 'RUBEN ', :last_name => 'MENDOZA AMADO', :email => 'info+173a@cursa.me',:password => 'HPK5ABgkBE', :group => 'Tercero A' },
        { :first_name => 'CESAR ', :last_name => 'RAMIREZ BERNABE', :email => 'info+183a@cursa.me',:password => 'x1bbWK8Oo0', :group => 'Tercero A' },
        { :first_name => 'PAOLA ITZEL', :last_name => 'SANCHEZ QUIROZ', :email => 'info+193a@cursa.me',:password => 'grhUp02r2n', :group => 'Tercero A' },
        { :first_name => 'ZAHORY ', :last_name => 'SILVERIO LARA', :email => 'info+203a@cursa.me',:password => 'XxEguYem3j', :group => 'Tercero A' },
        { :first_name => 'BENJAMIN ', :last_name => 'VELAZQUEZ JOSE', :email => 'info+213a@cursa.me',:password => 'Zp0uXBPIvM', :group => 'Tercero A' },
        { :first_name => 'ALBERTO ARTURO', :last_name => 'VILCHIS GONZALEZ', :email => 'info+223a@cursa.me',:password => 'FUUwJXS2dH', :group => 'Tercero A' }
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