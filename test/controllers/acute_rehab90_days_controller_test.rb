require 'test_helper'

class AcuteRehab90DaysControllerTest < ActionController::TestCase
  setup do
    @acute_rehab90_day = acute_rehab90_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acute_rehab90_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acute_rehab90_day" do
    assert_difference('AcuteRehab90Day.count') do
      post :create, acute_rehab90_day: {  }
    end

    assert_redirected_to acute_rehab90_day_path(assigns(:acute_rehab90_day))
  end

  test "should show acute_rehab90_day" do
    get :show, id: @acute_rehab90_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acute_rehab90_day
    assert_response :success
  end

  test "should update acute_rehab90_day" do
    patch :update, id: @acute_rehab90_day, acute_rehab90_day: {  }
    assert_redirected_to acute_rehab90_day_path(assigns(:acute_rehab90_day))
  end

  test "should destroy acute_rehab90_day" do
    assert_difference('AcuteRehab90Day.count', -1) do
      delete :destroy, id: @acute_rehab90_day
    end

    assert_redirected_to acute_rehab90_days_path
  end
end
