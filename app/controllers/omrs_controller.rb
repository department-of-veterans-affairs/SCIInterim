class OmrsController < ApplicationController
  layout 'patient_edit'

  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_omr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @omr = Omr.new
    @patient_nav = true
    respond_with(@omr)
  end

  def edit
  end

  def create
    @omr = Omr.new(omr_params)
    @omr.save
    puts omr_params
    @patient.episode_of_cares << @omr
    @patient.save
    respond_with(@omr, location: edit_patient_path(@patient))
  end

  def update
    @omr.update(omr_params)
    respond_with(@omr, location: edit_patient_path(@patient))
  end

  private
    def set_omr
      @omr = Omr.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def omr_params
      params.require(:omr).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
        :admission_date,
        :start_asia,
        :start_fim,
        :start_fam,
        :start_swls,
        :start_chart_sf,
        :start_sf_8,
        :dusoi,

        # GOAL
        :goal_fim,
        :goal_fam,

        # FINISH
        :omb_completed,
        :finish_asia,
        :finish_fim,
        :finish_fam,
        :finish_swls,
        :finish_chart_sf,
        :finish_sf_8,
        :finish_uspeq,
        :discharge_location)
    end
end
