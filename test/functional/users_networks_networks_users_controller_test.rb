require 'test_helper'

class UsersNetworksNetworksUsersControllerTest < ActionController::TestCase
  setup do
    @users_networks_networks_user = users_networks_networks_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_networks_networks_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_networks_networks_user" do
    assert_difference('UsersNetworksNetworksUser.count') do
      post :create, users_networks_networks_user: @users_networks_networks_user.attributes
    end

    assert_redirected_to users_networks_networks_user_path(assigns(:users_networks_networks_user))
  end

  test "should show users_networks_networks_user" do
    get :show, id: @users_networks_networks_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_networks_networks_user
    assert_response :success
  end

  test "should update users_networks_networks_user" do
    put :update, id: @users_networks_networks_user, users_networks_networks_user: @users_networks_networks_user.attributes
    assert_redirected_to users_networks_networks_user_path(assigns(:users_networks_networks_user))
  end

  test "should destroy users_networks_networks_user" do
    assert_difference('UsersNetworksNetworksUser.count', -1) do
      delete :destroy, id: @users_networks_networks_user
    end

    assert_redirected_to users_networks_networks_users_path
  end
end
