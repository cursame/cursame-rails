Given(/^a JSON request with email and password are correct like:$/) do |string|
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'email' => 'isaac+student@cursa.me','password' => 'cursame7'})
end

Then(/^respond a JSON with token and subdomain like:$/) do |string|
  JSON.parse(@req_c.body) == JSON.parse(string)
end

Given(/^a JSON request with email correct and password incorrect like:$/) do |string|
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'email' => 'isaac+student@cursa.me','password' => 'cursame'})
end

Then(/^respond a JSON response would have to be with 'Password incorrect' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end

Given(/^a JSON request with email incorrect and password correct like:$/) do |string|
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'email' => 'isaac+studen@cursa.me','password' => 'cursame7'})
end

Then(/^the JSON response would have to be with 'Email incorrect' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end

Given(/^a JSON request with nil or empty params like:$/) do |string|
  @req_c = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'email' => 'isaac+student@cursa.me'})
  @req_w_p = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'password' => 'cursame7'})
end

Then(/^the JSON response would have to be with 'Need password to process de request' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_c.body))
end

Then(/^the JSON response would have to be with 'Need email to process de request' description:$/) do |string|
  assert_equal(JSON.parse(string),JSON.parse(@req_w_p.body))
end