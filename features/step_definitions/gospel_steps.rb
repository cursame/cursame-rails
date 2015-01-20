def create_student
  @user = create(:user_with_student_role)
end

Given(/^I exist as a user$/) do
  create_student
end

Given(/^a new user$/) do
  create_student
end

Given(/^a new network$/) do
  @network = create(:network)
end

When(/^I sign in with valid credentials$/) do
  visit 'http://factory.lvh.me:3000/users/sign_in'
  fill_in "user_email", with: 'desarrollo+factory@cursa.me'
  fill_in "user_password", with: 'cursameFactory'
  click_button "sign_in"
end

Then(/^I successfully sign in$/) do
  assert_equal "http://factory.lvh.me:3000/?locale=es", current_url
end

Then(/^a task should be queued on Gospel::UsersWorker queue$/) do
  assert_equal 1, Gospel::UsersWorker.jobs.size
end

Then(/^a task should be queued on Gospel::NetworksWorker queue$/) do
  assert_equal 1, Gospel::NetworksWorker.jobs.size
end

Then(/^a task should be queued on Gospel::LoginsWorker queue$/) do
  assert_equal 1, Gospel::LoginsWorker.jobs.size
end
