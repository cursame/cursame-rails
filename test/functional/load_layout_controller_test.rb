require 'test_helper'

class LoadLayoutControllerTest < ActionController::TestCase
  test "should get load_wall" do
    get :load_wall
    assert_response :success
  end

  test "should get load_post_menu" do
    get :load_post_menu
    assert_response :success
  end

  test "should get load_sidebar" do
    get :load_sidebar
    assert_response :success
  end

  test "should get load_chat" do
    get :load_chat
    assert_response :success
  end

end
