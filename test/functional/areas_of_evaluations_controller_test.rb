require 'test_helper'

class AreasOfEvaluationsControllerTest < ActionController::TestCase
  setup do
    @areas_of_evaluation = areas_of_evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:areas_of_evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create areas_of_evaluation" do
    assert_difference('AreasOfEvaluation.count') do
      post :create, areas_of_evaluation: @areas_of_evaluation.attributes
    end

    assert_redirected_to areas_of_evaluation_path(assigns(:areas_of_evaluation))
  end

  test "should show areas_of_evaluation" do
    get :show, id: @areas_of_evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @areas_of_evaluation
    assert_response :success
  end

  test "should update areas_of_evaluation" do
    put :update, id: @areas_of_evaluation, areas_of_evaluation: @areas_of_evaluation.attributes
    assert_redirected_to areas_of_evaluation_path(assigns(:areas_of_evaluation))
  end

  test "should destroy areas_of_evaluation" do
    assert_difference('AreasOfEvaluation.count', -1) do
      delete :destroy, id: @areas_of_evaluation
    end

    assert_redirected_to areas_of_evaluations_path
  end
end
