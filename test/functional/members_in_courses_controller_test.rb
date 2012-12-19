require 'test_helper'

class MembersInCoursesControllerTest < ActionController::TestCase
  setup do
    @members_in_course = members_in_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members_in_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create members_in_course" do
    assert_difference('MembersInCourse.count') do
      post :create, members_in_course: @members_in_course.attributes
    end

    assert_redirected_to members_in_course_path(assigns(:members_in_course))
  end

  test "should show members_in_course" do
    get :show, id: @members_in_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @members_in_course
    assert_response :success
  end

  test "should update members_in_course" do
    put :update, id: @members_in_course, members_in_course: @members_in_course.attributes
    assert_redirected_to members_in_course_path(assigns(:members_in_course))
  end

  test "should destroy members_in_course" do
    assert_difference('MembersInCourse.count', -1) do
      delete :destroy, id: @members_in_course
    end

    assert_redirected_to members_in_courses_path
  end
end
