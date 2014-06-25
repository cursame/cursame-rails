# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

new_network = Network.create(name: 'pruebas', subdomain: 'pruebas', population: '300', public_register: true , free: true, register_form: true, welcom_message: 'Hola')

admin      = User.create(:email => "salvador+admin@cursa.me",      :password => "mmmmmm", :first_name => "Salvador", :last_name => "Mendo", :confirmed_at => Time.now, :personal_url => 'salvador_admin',      :domain => 'cursa.me', :subdomain => 'pruebas')
student    = User.create(:email => "salvador+student@cursa.me",    :password => "mmmmmm", :first_name => "Salvador", :last_name => "Mendo", :confirmed_at => Time.now, :personal_url => 'salvador_student',    :domain => 'cursa.me', :subdomain => 'pruebas')
teacher    = User.create(:email => "salvador+teacher@cursa.me",    :password => "mmmmmm", :first_name => "Salvador", :last_name => "Mendo", :confirmed_at => Time.now, :personal_url => 'salvador_teacher',    :domain => 'cursa.me', :subdomain => 'pruebas')
superadmin = User.create(:email => "salvador+superadmin@cursa.me", :password => "mmmmmm", :first_name => "Salvador", :last_name => "Mendo", :confirmed_at => Time.now, :personal_url => 'salvador_superadmin', :domain => 'cursa.me', :subdomain => 'pruebas')
supervisor = User.create(:email => "salvador+supervisor@cursa.me", :password => "mmmmmm", :first_name => "Salvador", :last_name => "Mendo", :confirmed_at => Time.now, :personal_url => 'salvador_supervisor', :domain => 'cursa.me', :subdomain => 'pruebas')

Permissioning.create(:user_id => admin.id,      :role_id => "1", :network_id => new_network.id)
Permissioning.create(:user_id => student.id,    :role_id => "2", :network_id => new_network.id)
Permissioning.create(:user_id => teacher.id,    :role_id => "3", :network_id => new_network.id)
Permissioning.create(:user_id => superadmin.id, :role_id => "4", :network_id => new_network.id)
Permissioning.create(:user_id => supervisor.id, :role_id => "5", :network_id => new_network.id)
