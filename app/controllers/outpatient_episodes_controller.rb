class OutpatientEpisodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create]
  before_action :set_outpatient_episode, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @outpatient_episodes = OutpatientEpisode.all
    respond_with(@outpatient_episodes)
  end

  def show
    respond_with(@outpatient_episode)
  end

  def new
    @outpatient_episode = OutpatientEpisode.new
    respond_with(@outpatient_episode)
  end

  def edit
  end

  def create
    @outpatient_episode = OutpatientEpisode.new(outpatient_episode_params)
    @outpatient_episode.save
    @patient.episode_of_cares << @outpatient_episode
    @patient.save
    respond_with(@outpatient_episode)
  end

  def update
    @outpatient_episode.update(outpatient_episode_params)
    respond_with(@outpatient_episode)
  end

  def destroy
    @outpatient_episode.destroy
    respond_with(@outpatient_episode)
  end

  private
    def set_outpatient_episode
      @outpatient_episode = OutpatientEpisode.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def outpatient_episode_params
      params.require(:outpatient_episode).permit(
        :patient_id,
        :episode_date,
        :fake_happiness
      )
    end
end
