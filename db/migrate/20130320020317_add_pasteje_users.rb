class AddPastejeUsers < ActiveRecord::Migration
  def up
    puts "se crea el primer curso"
    Course.create(:title => "Sexto A", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")
    User.create(:first_name => "", :last_name => "", :email => "", :password => "")
    @user = User.last
    @course = Course.last
    puts "creando estudiantes primer curso"
    Permissioning.create(:user_id => @user.id, :role_id => "2", :network_id => "1"  )
    puts "creando maestros primer curso"
    Permissioning.create(:user_id => @user.id, :role_id => "3", :network_id => "1"  )

    MembersInCourse.create(:user_id => @user.id, :course_id => @course.id, :accepted => true, :owner => false, :network_id => "1" )
    puts "se crea el segundo curso"
    Course.create(:title => "Sexto B", :init_date => "01/08/2012", :finish_date => "31/07/2013", :public_status => "private")
    User.create(:first_name => "", :last_name => "", :email => "", :password => "")
    MembersInCourse.create(:user_id => @user.id, :course_id => @course.id, :accepted => true, :owner => false, :network_id => "1" )
    puts "creando estudiantes segundo curso"
    Permissioning.create(:user_id => @user.id, :role_id => "2", :network_id => "1"  )
    puts "creando maestros segundo curso"
    Permissioning.create(:user_id => @user.id, :role_id => "3", :network_id => "1"  )
  end

  def down
  end
end