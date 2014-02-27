# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#   create migrate puts rake db:seed 
=begin
User.create(:email => "info+alejo@cursa.me", :first_name => 'Alejo', :last_name => 'Peralta', :personal_url => 'AlejoPeralta', :password => "alejop1" )
    a = User.last
     Permissioning.create( user_id: a.id, role_id: "1", :network_id => '2')
User.create(:email => "info+juan_roman@cursa.me", :first_name => 'Juan ', :last_name => 'Roman Escamilla', :personal_url => 'JuanRomanEscamilla', :password => "juanre1"  )
    b = User.last
     Permissioning.create( user_id: b.id, role_id: "1", :network_id => '2')
User.create(:email => "info+isc_carlosdv@cursa.me", :first_name => 'Carlos ', :last_name => 'Dominguez Valente', :personal_url => 'CarlosDominguezValente', :password => "carlosdv1" )
    c = User.last
     Permissioning.create( user_id: c.id, role_id: "1", :network_id => '2')
User.create(:email => "info+umendoza@cursa.me", :first_name => 'Ubaldo ', :last_name => 'Mendoza', :personal_url => 'UbaldoMendoza', :password => "ubaldom1" )
    d = User.last
    Permissioning.create( user_id: d.id, role_id: "1", :network_id => '2')
User.create(:email => "info+madayriv@cursa.me", :first_name => 'Sara ', :last_name => 'Maday', :personal_url => 'SaraMaday', :password => "saram1" )
    e = User.last
    Permissioning.create( user_id: e.id, role_id: "1", :network_id => '2')
User.create(:email => "info+curosas.lu@cursa.me", :first_name => 'Lucia ', :last_name => 'Cruz Rojas', :personal_url => 'LuciaCruzRojas', :password => "liciacr1" )
    f = User.last
    Permissioning.create( user_id: f.id, role_id: "1", :network_id => '2')
=end

######################### se crea un archivo de instalación directo para los locales ##############################


#n = Network.find_by_id(1)

n = Network.create(name: 'pruebas', subdomain: 'pruebas', population: '300', public_register: true , free: true, register_form: true, welcom_message: 'Hola')

u = User.create(:email => "juan+1@cursa.me", :password => "mmmmmm", :first_name => "Salvador", :last_name => "Lopez", :confirmed_at => Time.now, :personal_url => 'fiahfihfoi584dsd030', :domain => 'cursa.me', :subdomain => 'test')
u1 = User.create(:email => "fernanda+1@cursa.me", :password => "mmmmmm", :first_name => "Salvador s1", :last_name => "Lopez", :confirmed_at => Time.now, :personal_url => 'fiahfdssdsihfoi534284030',:domain => ' cursa.me', :subdomain => 'test')
u2 = User.create(:email => "rafael+1@cursa.me", :password => "mmmmmm", :first_name => "Salvador s2", :last_name => "Lopez", :confirmed_at => Time.now, :personal_url => 'fiahddsdsfih76543foi584030',:domain => 'cursa.me', :subdomain => 'test')
u3 = User.create(:email => "salvador+1@cursa.me", :password => "mmmmmm", :first_name => "Salvador s3", :last_name => "Lopez", :confirmed_at => Time.now, :personal_url => 'fiahfih76543311fdadaoi584030',:domain => 'cursa.me', :subdomain => 'test')

n_last = Network.last

p  = Permissioning.create(:user_id => u.id, :role_id => "2", :network_id => n_last.id )
p1 = Permissioning.create(:user_id => u1.id, :role_id => "2", :network_id => n_last.id )
p2 = Permissioning.create(:user_id => u2.id, :role_id => "2", :network_id => n_last.id )
p3 = Permissioning.create(:user_id => u3.id, :role_id => "2", :network_id => n_last.id )

User.update_all(:confirmed_at => Time.now)











    



