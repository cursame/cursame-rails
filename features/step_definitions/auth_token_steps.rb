def create_user
  @user = create(:user)
end

Given(/^a User$/) do
  create_user
end

Given(/^a JSON request with email and password are correct$/) do
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :body => {'email' => 'desarrollo+factory@cursa.me','password' => 'cursameFactory'}.to_json, :headers => {'Content-Type' => 'application/json'})
end

Then(/^respond a JSON with token and subdomain$/) do
  json = JSON.parse(@req_c.body)
  refute_nil json['status']
  refute_nil json['description']
  refute_nil json['response']
  refute_nil json['response']['token']
  refute_nil json['response']['subdomain']
  assert_equal json['response']['subdomain'], "factory"
end

Given(/^a JSON request with email correct and password incorrect$/) do
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :body => {'email' => 'desarrollo+factory@cursa.me','password' => 'cursame'}.to_json, :headers => {'Content-Type' => 'application/json'})
end

Then(/^respond a JSON response would have to be with 'Password incorrect' description:$/) do |string|
  assert_equal(JSON.parse(string), JSON.parse(@req_c.body))
end

Given(/^a JSON request with email incorrect and password correct$/) do
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :body => {'email' => 'desarrollo+factor@cursa.me','password' => 'cursameFactory'}.to_json, :headers => {'Content-Type' => 'application/json'})
end

Then(/^the JSON response would have to be with 'Email incorrect' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end

Given(/^a JSON request with nil or empty params$/) do
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :body => {'email' => 'desarrollo+factory@cursa.me'}.to_json, :headers => {'Content-Type' => 'application/json'})
  @req_w_p = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :body => {'password' => 'cursameFactory'}.to_json, :headers => {'Content-Type' => 'application/json'})
end

Then(/^the JSON response would have to be with 'Need password to process de request' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end

Then(/^the JSON response would have to be with 'Need email to process de request' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_w_p.body))
end


Given(/^a request with URL params\.$/) do
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create?email=isaac@cursa.me&password=cursame7')
end

Then(/^the JSON request shouldn't pass to process the data, and response should be like:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end