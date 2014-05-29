# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

new_network = Network.create(name: 'pruebas', subdomain: 'pruebas', population: '300', public_register: true , free: true, register_form: true, welcom_message: 'Hola')

admin      = User.create(:email => "luis+admin@cursa.me",      :password => "5949wh3aq", :first_name => "Luis Alfredo", :last_name => "Lorenzo Alva", :confirmed_at => Time.now, :personal_url => 'babis_admin',      :domain => 'cursa.me', :subdomain => 'pruebas')
student    = User.create(:email => "luis+student@cursa.me",    :password => "5949wh3aq", :first_name => "Luis Alfredo", :last_name => "Lorenzo Alva", :confirmed_at => Time.now, :personal_url => 'babis_student',    :domain => 'cursa.me', :subdomain => 'pruebas')
teacher    = User.create(:email => "luis+teacher@cursa.me",    :password => "5949wh3aq", :first_name => "Luis Alfredo", :last_name => "Lorenzo Alva", :confirmed_at => Time.now, :personal_url => 'babis_teacher',    :domain => 'cursa.me', :subdomain => 'pruebas')
superadmin = User.create(:email => "luis+superadmin@cursa.me", :password => "5949wh3aq", :first_name => "Luis Alfredo", :last_name => "Lorenzo Alva", :confirmed_at => Time.now, :personal_url => 'babis_superadmin', :domain => 'cursa.me', :subdomain => 'pruebas')
supervisor = User.create(:email => "luis+supervisor@cursa.me", :password => "5949wh3aq", :first_name => "Luis Alfredo", :last_name => "Lorenzo Alva", :confirmed_at => Time.now, :personal_url => 'babis_supervisor', :domain => 'cursa.me', :subdomain => 'pruebas')

Permissioning.create(:user_id => admin.id,      :role_id => "1", :network_id => new_network.id)
Permissioning.create(:user_id => student.id,    :role_id => "2", :network_id => new_network.id)
Permissioning.create(:user_id => teacher.id,    :role_id => "3", :network_id => new_network.id)
Permissioning.create(:user_id => superadmin.id, :role_id => "4", :network_id => new_network.id)
Permissioning.create(:user_id => supervisor.id, :role_id => "5", :network_id => new_network.id)
