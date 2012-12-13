require 'test_helper'

class ModulsControllerTest < ActionController::TestCase
  setup do
    @modul = moduls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moduls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modul" do
    assert_difference('Modul.count') do
      post :create, modul: @modul.attributes
    end

    assert_redirected_to modul_path(assigns(:modul))
  end

  test "should show modul" do
    get :show, id: @modul
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modul
    assert_response :success
  end

  test "should update modul" do
    put :update, id: @modul, modul: @modul.attributes
    assert_redirected_to modul_path(assigns(:modul))
  end

  test "should destroy modul" do
    assert_difference('Modul.count', -1) do
      delete :destroy, id: @modul
    end

    assert_redirected_to moduls_path
  end
end
