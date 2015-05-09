require 'test_helper'

class OutpatientEpisodesControllerTest < ActionController::TestCase
  setup do
    @outpatient_episode = outpatient_episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outpatient_episodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outpatient_episode" do
    assert_difference('OutpatientEpisode.count') do
      post :create, outpatient_episode: {  }
    end

    assert_redirected_to outpatient_episode_path(assigns(:outpatient_episode))
  end

  test "should show outpatient_episode" do
    get :show, id: @outpatient_episode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outpatient_episode
    assert_response :success
  end

  test "should update outpatient_episode" do
    patch :update, id: @outpatient_episode, outpatient_episode: {  }
    assert_redirected_to outpatient_episode_path(assigns(:outpatient_episode))
  end

  test "should destroy outpatient_episode" do
    assert_difference('OutpatientEpisode.count', -1) do
      delete :destroy, id: @outpatient_episode
    end

    assert_redirected_to outpatient_episodes_path
  end
end
