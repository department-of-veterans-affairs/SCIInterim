require 'test_helper'

class Omr1YearsControllerTest < ActionController::TestCase
  setup do
    @omr1_year = omr1_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omr1_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omr1_year" do
    assert_difference('Omr1Year.count') do
      post :create, omr1_year: {  }
    end

    assert_redirected_to omr1_year_path(assigns(:omr1_year))
  end

  test "should show omr1_year" do
    get :show, id: @omr1_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omr1_year
    assert_response :success
  end

  test "should update omr1_year" do
    patch :update, id: @omr1_year, omr1_year: {  }
    assert_redirected_to omr1_year_path(assigns(:omr1_year))
  end

  test "should destroy omr1_year" do
    assert_difference('Omr1Year.count', -1) do
      delete :destroy, id: @omr1_year
    end

    assert_redirected_to omr1_years_path
  end
end
