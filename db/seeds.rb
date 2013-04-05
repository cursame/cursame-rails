# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#   create migrate puts rake db:seed 
User.create(:email => "info+alejo@cursa.me", :first_name => 'Alejo', :last_name => 'Peralta', :personal_url => 'AlejoPeralta', :password => "alejop1" )
    a = User.last
     Permissioning.create( user_id: a.id, role_id: "1", :network_id => '2')
User.create(:email => "info+juan_roman@cursa.me", :first_name => 'Juan ', :last_name => 'Roman Escamilla', :personal_url => 'JuanRomanEscamilla', :password => "juanre1"  )
    b = User.last
     Permissioning.create( user_id: b.id, role_id: "1", :network_id => '2')
User.create(:email => "isc_carlosdv@hotmail.com", :first_name => 'Carlos ', :last_name => 'Dominguez Valente', :personal_url => 'CarlosDominguezValente', :password => "carlosdv1" )
    c = User.last
     Permissioning.create( user_id: c.id, role_id: "1", :network_id => '2')
User.create(:email => "umendoza@iusa.com.mx", :first_name => 'Ubaldo ', :last_name => 'Mendoza', :personal_url => 'UbaldoMendoza', :password => "ubaldom1" )
    d = User.last
    Permissioning.create( user_id: d.id, role_id: "1", :network_id => '2')
User.create(:email => "madayriv@gmail.com", :first_name => 'Sara ', :last_name => 'Maday', :personal_url => 'SaraMaday', :password => "saram1" )
    e = User.last
    Permissioning.create( user_id: e.id, role_id: "1", :network_id => '2')
User.create(:email => "curosas.lu@gmail.com", :first_name => 'Lucia ', :last_name => 'Cruz Rojas', :personal_url => 'LuciaCruzRojas', :password => "liciacr1" )
    f = User.last
    Permissioning.create( user_id: f.id, role_id: "1", :network_id => '2')

    



