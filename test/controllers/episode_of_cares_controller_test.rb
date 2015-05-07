require 'test_helper'

class EpisodeOfCaresControllerTest < ActionController::TestCase
  setup do
    @episode_of_care = episode_of_cares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episode_of_cares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode_of_care" do
    assert_difference('EpisodeOfCare.count') do
      post :create, episode_of_care: {  }
    end

    assert_redirected_to episode_of_care_path(assigns(:episode_of_care))
  end

  test "should show episode_of_care" do
    get :show, id: @episode_of_care
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @episode_of_care
    assert_response :success
  end

  test "should update episode_of_care" do
    patch :update, id: @episode_of_care, episode_of_care: {  }
    assert_redirected_to episode_of_care_path(assigns(:episode_of_care))
  end

  test "should destroy episode_of_care" do
    assert_difference('EpisodeOfCare.count', -1) do
      delete :destroy, id: @episode_of_care
    end

    assert_redirected_to episode_of_cares_path
  end
end
