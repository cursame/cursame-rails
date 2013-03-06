require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "new_delivery_notification" do
    mail = Notifier.new_delivery_notification
    assert_equal "New delivery notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
