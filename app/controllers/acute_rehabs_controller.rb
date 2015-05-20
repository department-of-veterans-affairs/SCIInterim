class AcuteRehabsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_acute_rehab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @acute_rehab = AcuteRehab.new
    respond_with(@acute_rehab)
  end

  def edit
  end

  def create
    @acute_rehab = AcuteRehab.new(acute_rehab_params)
    @acute_rehab.save
    @patient.episode_of_cares << @acute_rehab
    @patient.save
    respond_with(@acute_rehab, location: edit_patient_path(@patient))
  end

  def update
    @acute_rehab.update(acute_rehab_params)
    respond_with(@acute_rehab, location: edit_patient_path(@patient))
  end

  private
    def set_acute_rehab
      @acute_rehab = AcuteRehab.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def acute_rehab_params
      params.require(:acute_rehab).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
      )
    end
end
