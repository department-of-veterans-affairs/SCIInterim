class Omr90DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_omr90_day, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @omr90_day = Omr90Day.new
    respond_with(@omr90_day)
  end

  def edit
  end

  def create
    @omr90_day = Omr90Day.new(omr90_day_params)
    @omr90_day.save
    @patient.episode_of_cares << @omr90_day
    @patient.save
    respond_with(@omr90_day, location: edit_patient_path(@patient))
  end

  def update
    @omr90_day.update(omr90_day_params)
    respond_with(@omr90_day, location: edit_patient_path(@patient))
  end

  private
    def set_omr90_day
      @omr90_day = Omr90Day.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def omr90_day_params
      params.require(:omr90_day).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
        :followup_date,
        :fim,
        :fam,
        :swls,
        :chart_sf,
        :sf_8,
        :place_of_residence)
    end
end
