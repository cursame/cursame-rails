task :tenhundredusers => :environment do

=begin
9600.times do
  n = n + 1
  ################ se crean 9600 usuarios ################
  u = User.create(:email => "jose_alfredo+#{n}@cursa.me", :password => "mmmmmm", :first_name => "Alfredo#{n}", :last_name => "Reyes#{n}", :confirmed_at => Time.now, :personal_url => "fiahfihfoi584030311313#{n}", :domain => 'lvh.me', :subdomain => 'pruebas')
  puts "#{u}"
  ################ se agregan studiantes a la red ##############
  students = Permissioning.create(:user_id => u.id, :role_id => "2", :network_id => n_last.id )
end

30.times do
  n = n + 1
  ################ se crean 400 usuarios ################
  u1 = User.create(:email => "jose_alfredo+#{n}@cursa.me", :password => "mmmmmm", :first_name => "Alfredo#{n}", :last_name => "Reyes#{n}", :confirmed_at => Time.now, :personal_url => "fiahfihfoi584030311313#{n}", :domain => 'lvh.me', :subdomain => 'pruebas')
  puts "#{u1}"
  ################ se agregan profesores a la red ##############
  teacher = Permissioning.create(:user_id => u1.id, :role_id => "3", :network_id => n_last.id )
end

n = 0
n_last = Network.last
User.all.each do |u|
  @p = u.permissionings.last
  @role = Role.find(@p.role_id)
  
  5.times do
    n = n + 1
    c = Comment.create(title: "cursame#{n}", comment: "Comment#{n}", commentable_id: 1, commentable_type: "Network", user_id: 1, role: "comments", created_at: Time.now, updated_at: Time.now, netwok_id: nil, comment_html: "<p><p>Comment#{n}</p>\n</p>", network_id: 1, likes: nil)
   puts "#{c}"
  end
end
=end

u = User.all 
u.each do |ui|
  ui.avatar = '/assets/imagex.png'
  ui.save
end
end