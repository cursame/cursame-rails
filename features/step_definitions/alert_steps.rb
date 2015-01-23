def create_student
  @user = create(:user_with_student_role)
end

def sign_in
  visit 'http://factory.lvh.me:3000/users/sign_in'
  fill_in "user_email", with: 'desarrollo+factory@cursa.me'
  fill_in "user_password", with: 'cursameFactory'
  click_button "sign_in"
end

def send_success_alert
  visit 'http://factory.lvh.me:3000/?alert=success&message=success%20message'
end

def send_error_alert
  visit 'http://factory.lvh.me:3000/?alert=error&message=error%20message'
end

def send_notice_alert
  visit 'http://factory.lvh.me:3000/?alert=notice&message=notice%20message'
end

Given(/^I exist as an user$/) do
  create_student
end

Given(/^I have signed in with valid credentials$/) do
  sign_in
end

When(/^I visit cursame with success alert parameters$/) do
  send_success_alert
end

When(/^I visit cursame with error alert parameters$/) do
  send_error_alert
end

When(/^I visit cursame with notice alert parameters$/) do
  send_notice_alert
end

Then(/^the success alert message must be displayed$/) do
  page.should have_css('div.success#notice')
end

Then(/^the error alert message must be displayed$/) do
  page.should have_css('div.error#notice')
end

Then(/^the notice alert message must be displayed$/) do
  page.should have_css('div.notice#notice')
end
