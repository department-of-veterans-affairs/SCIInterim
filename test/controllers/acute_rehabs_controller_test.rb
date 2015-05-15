require 'test_helper'

class AcuteRehabsControllerTest < ActionController::TestCase
  setup do
    @acute_rehab = acute_rehabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acute_rehabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acute_rehab" do
    assert_difference('AcuteRehab.count') do
      post :create, acute_rehab: {  }
    end

    assert_redirected_to acute_rehab_path(assigns(:acute_rehab))
  end

  test "should show acute_rehab" do
    get :show, id: @acute_rehab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acute_rehab
    assert_response :success
  end

  test "should update acute_rehab" do
    patch :update, id: @acute_rehab, acute_rehab: {  }
    assert_redirected_to acute_rehab_path(assigns(:acute_rehab))
  end

  test "should destroy acute_rehab" do
    assert_difference('AcuteRehab.count', -1) do
      delete :destroy, id: @acute_rehab
    end

    assert_redirected_to acute_rehabs_path
  end
end
