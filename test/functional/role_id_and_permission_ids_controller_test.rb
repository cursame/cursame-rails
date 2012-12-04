require 'test_helper'

class RoleIdAndPermissionIdsControllerTest < ActionController::TestCase
  setup do
    @role_id_and_permission_id = role_id_and_permission_ids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_id_and_permission_ids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_id_and_permission_id" do
    assert_difference('RoleIdAndPermissionId.count') do
      post :create, role_id_and_permission_id: @role_id_and_permission_id.attributes
    end

    assert_redirected_to role_id_and_permission_id_path(assigns(:role_id_and_permission_id))
  end

  test "should show role_id_and_permission_id" do
    get :show, id: @role_id_and_permission_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_id_and_permission_id
    assert_response :success
  end

  test "should update role_id_and_permission_id" do
    put :update, id: @role_id_and_permission_id, role_id_and_permission_id: @role_id_and_permission_id.attributes
    assert_redirected_to role_id_and_permission_id_path(assigns(:role_id_and_permission_id))
  end

  test "should destroy role_id_and_permission_id" do
    assert_difference('RoleIdAndPermissionId.count', -1) do
      delete :destroy, id: @role_id_and_permission_id
    end

    assert_redirected_to role_id_and_permission_ids_path
  end
end
