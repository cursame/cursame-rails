# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

new_network = Network.create(name: 'pruebas', subdomain: 'pruebas', population: '300', public_register: true , free: true, register_form: true, welcom_message: 'Hola')

admin      = User.create(:email => "luisr+admin@cursa.me",      :password => "cursame7", :first_name => "Luis Alfredo", :last_name => "Admin",      :confirmed_at => Time.now, :personal_url => 'babas_admin',      :domain => 'cursa.me', :subdomain => 'pruebas')
student    = User.create(:email => "luisr+student@cursa.me",    :password => "cursame7", :first_name => "Luis Alfredo", :last_name => "Student",    :confirmed_at => Time.now, :personal_url => 'babas_student',    :domain => 'cursa.me', :subdomain => 'pruebas')
teacher    = User.create(:email => "luisr+teacher@cursa.me",    :password => "cursame7", :first_name => "Luis Alfredo", :last_name => "Teacher",    :confirmed_at => Time.now, :personal_url => 'babas_teacher',    :domain => 'cursa.me', :subdomain => 'pruebas')
superadmin = User.create(:email => "luisr+superadmin@cursa.me", :password => "cursame7", :first_name => "Luis Alfredo", :last_name => "Superadmin", :confirmed_at => Time.now, :personal_url => 'babas_superadmin', :domain => 'cursa.me', :subdomain => 'pruebas')
supervisor = User.create(:email => "luisr+supervisor@cursa.me", :password => "cursame7", :first_name => "Luis Alfredo", :last_name => "Supervisor", :confirmed_at => Time.now, :personal_url => 'babas_supervisor', :domain => 'cursa.me', :subdomain => 'pruebas')

Permissioning.create(:user_id => admin.id,      :role_id => "1", :network_id => new_network.id)
Permissioning.create(:user_id => student.id,    :role_id => "2", :network_id => new_network.id)
Permissioning.create(:user_id => teacher.id,    :role_id => "3", :network_id => new_network.id)
Permissioning.create(:user_id => superadmin.id, :role_id => "4", :network_id => new_network.id)
Permissioning.create(:user_id => supervisor.id, :role_id => "5", :network_id => new_network.id)
