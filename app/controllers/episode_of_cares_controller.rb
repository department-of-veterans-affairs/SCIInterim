class EpisodeOfCaresController < ApplicationController
  before_action :set_episode_of_care, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @episode_of_cares = EpisodeOfCare.all
    respond_with(@episode_of_cares)
  end

  def new
    @episode_of_care = EpisodeOfCare.new
    respond_with(@episode_of_care)
  end

  def edit
  end

  def create
    @episode_of_care = EpisodeOfCare.new(episode_of_care_params)
    @episode_of_care.save
    respond_with(@episode_of_care)
  end

  def update
    @episode_of_care.update(episode_of_care_params)
    respond_with(@episode_of_care)
  end

  private
    def set_episode_of_care
      @episode_of_care = EpisodeOfCare.find(params[:id])
    end

    def episode_of_care_params
      params[:episode_of_care]
    end
end
