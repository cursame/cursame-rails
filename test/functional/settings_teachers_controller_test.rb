require 'test_helper'

class SettingsTeachersControllerTest < ActionController::TestCase
  setup do
    @settings_teacher = settings_teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settings_teacher" do
    assert_difference('SettingsTeacher.count') do
      post :create, settings_teacher: @settings_teacher.attributes
    end

    assert_redirected_to settings_teacher_path(assigns(:settings_teacher))
  end

  test "should show settings_teacher" do
    get :show, id: @settings_teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settings_teacher
    assert_response :success
  end

  test "should update settings_teacher" do
    put :update, id: @settings_teacher, settings_teacher: @settings_teacher.attributes
    assert_redirected_to settings_teacher_path(assigns(:settings_teacher))
  end

  test "should destroy settings_teacher" do
    assert_difference('SettingsTeacher.count', -1) do
      delete :destroy, id: @settings_teacher
    end

    assert_redirected_to settings_teachers_path
  end
end
