require 'test_helper'

class SuperadmninControllerTest < ActionController::TestCase
  test "should get statistics" do
    get :statistics
    assert_response :success
  end

  test "should get networks" do
    get :networks
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get activities" do
    get :activities
    assert_response :success
  end

  test "should get roles" do
    get :roles
    assert_response :success
  end

  test "should get create_super_admin" do
    get :create_super_admin
    assert_response :success
  end

  test "should get courses_sintetic_view_and_edit" do
    get :courses_sintetic_view_and_edit
    assert_response :success
  end

  test "should get publicity_modul_controller" do
    get :publicity_modul_controller
    assert_response :success
  end

end
