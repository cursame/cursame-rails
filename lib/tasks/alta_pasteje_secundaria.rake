task :add_pasteje_sec_1a => :environment do
    alumnos = [ 
        { :first_name => 'ALINE', :last_name => 'ALMAZAN SALAZAR', :email => 'info+sec_01A@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' },
        { :first_name => 'ALINE', :last_name => 'ALMAZAN SALAZAR', :email => 'info+sec_01A@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' },
        { :first_name => 'ALINE', :last_name => 'ALMAZAN SALAZAR', :email => 'info+sec_01A@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' },
        { :first_name => 'ALINE', :last_name => 'ALMAZAN SALAZAR', :email => 'info+sec_01A@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' },
        { :first_name => 'ALINE', :last_name => 'ALMAZAN SALAZAR', :email => 'info+sec_01A@cursa.me', :password => '09lN7nQ0Kf', :group => 'A' }
    ]

    maestros = [ { :first_name => 'Mabel', :last_name => 'Cruz Sotelo', :email => 'info+sec_00A@cursa.me', :password => 'ytWrwi9t4A' } ]

    course = Course.create(:title => "Secundaria Primero A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private", :network_id => "2")

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
     
     MembersInCourse.create :user_id => 4, :course_id => 3, :accepted => true, :owner => true, :network_id => '2', :active_status => true
     MembersInCourse.create :user_id => 4, :course_id => 4, :accepted => true, :owner => true, :network_id => '2', :active_status => true
     
end
