task :usuarios_test => :environment do

		u1 = User.create(:email => "rafael@cursa.me", :password => "123456", :first_name => "Rafael", :last_name => "Camps", :confirmed_at => Time.now, :personal_url => 'fiahfihfoi534284030',:domain => ' cursa.me', :subdomain => 'test')
		u3 = User.create(:email => "salvador@cursa.me", :password => "mmmmmm", :first_name => "Salvador", :last_name => "Lopez", :confirmed_at => Time.now, :personal_url => 'fiahfih76543foi584030',:domain => 'cursa.me', :subdomain => 'test')


		n_last = Network.find_by_subdomain("test")


				puts "#{n_last}"
				puts "#{u1}"
				puts "#{u3}"
        

		p1 = Permissioning.create(:user_id => u1.id, :role_id => "3", :network_id => n_last.id )
		p3 = Permissioning.create(:user_id => u3.id, :role_id => "3", :network_id => n_last.id )

				puts "#{p1}"
				puts "#{p3}"

end