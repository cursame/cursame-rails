Given(/^a new user$/) do
  @user = create(:user_with_student_role)
end

Then(/^a task should be queued on Gospel::UsersWorker queue$/) do
  assert_equal 1, Gospel::UsersWorker.jobs.size
end

Given(/^a new network$/) do
  @network = create(:network)
end

Then(/^a task should be queued on Gospel::NetworksWorker queue$/) do
  assert_equal 1, Gospel::NetworksWorker.jobs.size
end
