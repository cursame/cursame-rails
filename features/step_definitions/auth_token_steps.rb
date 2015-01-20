Given(/^a JSON request with email and password:$/) do |string|
	@last_response = HTTParty.post('http://pruebas.lvh.me:3000/api/sessions/create', :query => {'email' => 'isaac+studen@cursa.me', 'password' => 'cursame7'})
end

Then(/^respond a JSON with token and subdomain like:$/) do |string| 
	JSON.parse(@last_response.body) == JSON.parse(string)

end



