require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get conditions" do
    get :conditions
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get develop" do
    get :develop
    assert_response :success
  end

  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

end
