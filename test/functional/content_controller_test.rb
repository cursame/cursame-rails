require 'test_helper'

class ContentControllerTest < ActionController::TestCase
  test "should get youtube" do
    get :youtube
    assert_response :success
  end

  test "should get vimeo" do
    get :vimeo
    assert_response :success
  end

  test "should get wikipedia" do
    get :wikipedia
    assert_response :success
  end

  test "should get orkut" do
    get :orkut
    assert_response :success
  end

  test "should get khanacademy" do
    get :khanacademy
    assert_response :success
  end

end
