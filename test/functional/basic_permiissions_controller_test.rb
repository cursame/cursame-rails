require 'test_helper'

class BasicPermiissionsControllerTest < ActionController::TestCase
  setup do
    @basic_permiission = basic_permiissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_permiissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_permiission" do
    assert_difference('BasicPermiission.count') do
      post :create, basic_permiission: @basic_permiission.attributes
    end

    assert_redirected_to basic_permiission_path(assigns(:basic_permiission))
  end

  test "should show basic_permiission" do
    get :show, id: @basic_permiission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_permiission
    assert_response :success
  end

  test "should update basic_permiission" do
    put :update, id: @basic_permiission, basic_permiission: @basic_permiission.attributes
    assert_redirected_to basic_permiission_path(assigns(:basic_permiission))
  end

  test "should destroy basic_permiission" do
    assert_difference('BasicPermiission.count', -1) do
      delete :destroy, id: @basic_permiission
    end

    assert_redirected_to basic_permiissions_path
  end
end
