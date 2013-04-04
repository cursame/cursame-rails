require 'test_helper'

class MembersInGroupsControllerTest < ActionController::TestCase
  setup do
    @members_in_group = members_in_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members_in_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create members_in_group" do
    assert_difference('MembersInGroup.count') do
      post :create, members_in_group: @members_in_group.attributes
    end

    assert_redirected_to members_in_group_path(assigns(:members_in_group))
  end

  test "should show members_in_group" do
    get :show, id: @members_in_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @members_in_group
    assert_response :success
  end

  test "should update members_in_group" do
    put :update, id: @members_in_group, members_in_group: @members_in_group.attributes
    assert_redirected_to members_in_group_path(assigns(:members_in_group))
  end

  test "should destroy members_in_group" do
    assert_difference('MembersInGroup.count', -1) do
      delete :destroy, id: @members_in_group
    end

    assert_redirected_to members_in_groups_path
  end
end
