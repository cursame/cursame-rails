require 'test_helper'

class ManagersControllerTest < ActionController::TestCase
  test "should get wall" do
    get :wall
    assert_response :success
  end

  test "should get members" do
    get :members
    assert_response :success
  end

  test "should get network_configuration" do
    get :network_configuration
    assert_response :success
  end

end
