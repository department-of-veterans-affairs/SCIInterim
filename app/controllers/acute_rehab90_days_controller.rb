class AcuteRehab90DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create]
  before_action :set_acute_rehab90_day, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @acute_rehab90_day = AcuteRehab90Day.new
    respond_with(@acute_rehab90_day)
  end

  def edit
  end

  def create
    @acute_rehab90_day = AcuteRehab90Day.new(acute_rehab90_day_params)
    @acute_rehab90_day.save
    @patient.episode_of_cares << @acute_rehab90_day
    @patient.save
    respond_with(@acute_rehab90_day, location: edit_patient_path(@patient))
  end

  def update
    @acute_rehab90_day.update(acute_rehab90_day_params)
    respond_with(@acute_rehab90_day, location: edit_patient_path(@patient))
  end

  private
    def set_acute_rehab90_day
      @acute_rehab90_day = AcuteRehab90Day.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def acute_rehab90_day_params
      params.require(:acute_rehab90_day).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
      )
    end
end
