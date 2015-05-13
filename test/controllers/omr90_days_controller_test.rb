require 'test_helper'

class Omr90DaysControllerTest < ActionController::TestCase
  setup do
    @omr90_day = omr90_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omr90_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omr90_day" do
    assert_difference('Omr90Day.count') do
      post :create, omr90_day: {  }
    end

    assert_redirected_to omr90_day_path(assigns(:omr90_day))
  end

  test "should show omr90_day" do
    get :show, id: @omr90_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omr90_day
    assert_response :success
  end

  test "should update omr90_day" do
    patch :update, id: @omr90_day, omr90_day: {  }
    assert_redirected_to omr90_day_path(assigns(:omr90_day))
  end

  test "should destroy omr90_day" do
    assert_difference('Omr90Day.count', -1) do
      delete :destroy, id: @omr90_day
    end

    assert_redirected_to omr90_days_path
  end
end
