require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Notification.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Notification.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Notification.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to notification_url(assigns(:notification))
  end

  def test_edit
    get :edit, :id => Notification.first
    assert_template 'edit'
  end

  def test_update_invalid
    Notification.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Notification.first
    assert_template 'edit'
  end

  def test_update_valid
    Notification.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Notification.first
    assert_redirected_to notification_url(assigns(:notification))
  end

  def test_destroy
    notification = Notification.first
    delete :destroy, :id => notification
    assert_redirected_to notifications_url
    assert !Notification.exists?(notification.id)
  end
end
