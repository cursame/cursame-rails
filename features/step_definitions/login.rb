# coding: utf-8
And(/^I login with email "(.*?)" and password "(.*?)"\.$/) do |email, password|
  
  visit("http://testing.lvh.me:3000/users/sign_in")

  within("#new_user.sign-in-form") do
    fill_in 'user_email', :with => "#{email}"
    fill_in 'user_password', :with => "#{password}"
  end
  
  click_button "Iniciar Sesión"
  p page.current_url
  expect(page.current_url).to eq("http://testing.lvh.me:3000/")
end
