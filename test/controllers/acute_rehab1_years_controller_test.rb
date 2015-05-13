require 'test_helper'

class AcuteRehab1YearsControllerTest < ActionController::TestCase
  setup do
    @acute_rehab1_year = acute_rehab1_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acute_rehab1_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acute_rehab1_year" do
    assert_difference('AcuteRehab1Year.count') do
      post :create, acute_rehab1_year: {  }
    end

    assert_redirected_to acute_rehab1_year_path(assigns(:acute_rehab1_year))
  end

  test "should show acute_rehab1_year" do
    get :show, id: @acute_rehab1_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acute_rehab1_year
    assert_response :success
  end

  test "should update acute_rehab1_year" do
    patch :update, id: @acute_rehab1_year, acute_rehab1_year: {  }
    assert_redirected_to acute_rehab1_year_path(assigns(:acute_rehab1_year))
  end

  test "should destroy acute_rehab1_year" do
    assert_difference('AcuteRehab1Year.count', -1) do
      delete :destroy, id: @acute_rehab1_year
    end

    assert_redirected_to acute_rehab1_years_path
  end
end
