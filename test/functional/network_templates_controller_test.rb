require 'test_helper'

class NetworkTemplatesControllerTest < ActionController::TestCase
  setup do
    @network_template = network_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_template" do
    assert_difference('NetworkTemplate.count') do
      post :create, network_template: @network_template.attributes
    end

    assert_redirected_to network_template_path(assigns(:network_template))
  end

  test "should show network_template" do
    get :show, id: @network_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_template
    assert_response :success
  end

  test "should update network_template" do
    put :update, id: @network_template, network_template: @network_template.attributes
    assert_redirected_to network_template_path(assigns(:network_template))
  end

  test "should destroy network_template" do
    assert_difference('NetworkTemplate.count', -1) do
      delete :destroy, id: @network_template
    end

    assert_redirected_to network_templates_path
  end
end
