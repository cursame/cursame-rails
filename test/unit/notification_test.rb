require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Notification.new.valid?
  end
end
