Given(/^a new user$/) do
  @user = create(:user_with_student_role)
end

Then(/^a request to Gospel API should be queued$/) do
  assert_equal 1, Gospel::UsersWorker.jobs.size
end
