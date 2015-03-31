def sign_in_as(role)
  @current_user = create("user_with_#{role}_role".to_s)
  visit 'http://factory.lvh.me:3000/users/sign_in'
  fill_in "user_email", with: 'desarrollo+factory@cursa.me'
  fill_in "user_password", with: 'cursameFactory'
  click_button "sign_in"
end

Before("admin_signed_in") do
  sign_in_as("admin")
end

Then(/^the signed in user should be able to share a wufoo form with the students in the network$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user should be able to share a wufoo form with the teachers in the network$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user should be able to share a wufoo form with the students and teachers in the network$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user should be able to share a wufoo form with the students in the course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user should be able to share a wufoo form with the teachers in the course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user should be able to share a wufoo form with the students and teachers in the course$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a network wufoo form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the signed in user answers the wuffo form$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a course wufoo form$/) do
  pending # express the regexp above with the code you wish you had
end