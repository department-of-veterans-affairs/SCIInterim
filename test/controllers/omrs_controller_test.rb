require 'test_helper'

class OmrsControllerTest < ActionController::TestCase
  setup do
    @omr = omrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omr" do
    assert_difference('Omr.count') do
      post :create, omr: {  }
    end

    assert_redirected_to omr_path(assigns(:omr))
  end

  test "should show omr" do
    get :show, id: @omr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omr
    assert_response :success
  end

  test "should update omr" do
    patch :update, id: @omr, omr: {  }
    assert_redirected_to omr_path(assigns(:omr))
  end

  test "should destroy omr" do
    assert_difference('Omr.count', -1) do
      delete :destroy, id: @omr
    end

    assert_redirected_to omrs_path
  end
end
