task :remove_3a_from_bs => :environment do
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
    alumnos2b = [      
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
    
     alumnos2a.each do |alumno|
      user = User.find_by_email(alumno[:email])
      MembersInCourse.where( :user_id => user.id, :course_id => 16).destroy_all
      MembersInCourse.where( :user_id => user.id, :course_id => 18).destroy_all
      MembersInCourse.where( :user_id => user.id, :course_id => 20).destroy_all
      MembersInCourse.where( :user_id => user.id, :course_id => 22).destroy_all
      MembersInCourse.where( :user_id => user.id, :course_id => 24).destroy_all
    end 

    alumnos2b.each do |alumno|
      user = User.find_by_email(alumno[:email])

      MembersInCourse.create :user_id => user.id, :course_id => 16, :accepted => true, :owner => false, :network_id => 6, :active_status => true
      MembersInCourse.create :user_id => user.id, :course_id => 18, :accepted => true, :owner => false, :network_id => 6, :active_status => true
      MembersInCourse.create :user_id => user.id, :course_id => 20, :accepted => true, :owner => false, :network_id => 6, :active_status => true
      MembersInCourse.create :user_id => user.id, :course_id => 22, :accepted => true, :owner => false, :network_id => 6, :active_status => true
      MembersInCourse.create :user_id => user.id, :course_id => 24, :accepted => true, :owner => false, :network_id => 6, :active_status => true

    end 
end