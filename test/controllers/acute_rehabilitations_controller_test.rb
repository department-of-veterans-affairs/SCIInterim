require 'test_helper'

class AcuteRehabilitationsControllerTest < ActionController::TestCase
  setup do
    @acute_rehabilitation = acute_rehabilitations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acute_rehabilitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acute_rehabilitation" do
    assert_difference('AcuteRehabilitation.count') do
      post :create, acute_rehabilitation: {  }
    end

    assert_redirected_to acute_rehabilitation_path(assigns(:acute_rehabilitation))
  end

  test "should show acute_rehabilitation" do
    get :show, id: @acute_rehabilitation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acute_rehabilitation
    assert_response :success
  end

  test "should update acute_rehabilitation" do
    patch :update, id: @acute_rehabilitation, acute_rehabilitation: {  }
    assert_redirected_to acute_rehabilitation_path(assigns(:acute_rehabilitation))
  end

  test "should destroy acute_rehabilitation" do
    assert_difference('AcuteRehabilitation.count', -1) do
      delete :destroy, id: @acute_rehabilitation
    end

    assert_redirected_to acute_rehabilitations_path
  end
end
