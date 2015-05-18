class AcuteRehab1YearsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create]
  before_action :set_acute_rehab1_year, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @acute_rehab1_year = AcuteRehab1Year.new
    respond_with(@acute_rehab1_year)
  end

  def edit
  end

  def create
    @acute_rehab1_year = AcuteRehab1Year.new(acute_rehab1_year_params)
    @acute_rehab1_year.save
    @patient.episode_of_cares << @acute_rehab1_year
    @patient.save
    respond_with(@acute_rehab1_year)
  end

  def update
    @acute_rehab1_year.update(acute_rehab1_year_params)
    respond_with(@acute_rehab1_year)
  end

  private
    def set_acute_rehab1_year
      @acute_rehab1_year = AcuteRehab1Year.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def acute_rehab1_year_params
      params.require(:acute_rehab1_year).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
      )
    end
end
