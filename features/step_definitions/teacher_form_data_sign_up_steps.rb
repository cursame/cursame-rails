Given(/^we have a "(.*?)" Model$/) do |model_name|
  assert_equal(true, eval("defined?(#{model_name}) && #{model_name}.is_a?(Class)"))
end

When(/^we test the "(.*?)" Model$/) do |model_name|
  @test_model = Object.const_get(model_name).new
end

Then(/^the Test Model should have attribute "(.*?)"$/) do |attribute|
  assert_equal(true, @test_model.has_attribute?(attribute))
end