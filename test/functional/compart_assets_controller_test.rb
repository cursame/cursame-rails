require 'test_helper'

class CompartAssetsControllerTest < ActionController::TestCase
  setup do
    @compart_asset = compart_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compart_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compart_asset" do
    assert_difference('CompartAsset.count') do
      post :create, compart_asset: @compart_asset.attributes
    end

    assert_redirected_to compart_asset_path(assigns(:compart_asset))
  end

  test "should show compart_asset" do
    get :show, id: @compart_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compart_asset
    assert_response :success
  end

  test "should update compart_asset" do
    put :update, id: @compart_asset, compart_asset: @compart_asset.attributes
    assert_redirected_to compart_asset_path(assigns(:compart_asset))
  end

  test "should destroy compart_asset" do
    assert_difference('CompartAsset.count', -1) do
      delete :destroy, id: @compart_asset
    end

    assert_redirected_to compart_assets_path
  end
end
