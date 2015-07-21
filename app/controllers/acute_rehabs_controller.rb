class AcuteRehabsController < ApplicationController
  include AttributeParam 

  layout 'patient_edit'

  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_acute_rehab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @acute_rehab = AcuteRehab.new
    @acute_rehab.build_start_asia_assessment
    @acute_rehab.build_finish_asia_assessment
    respond_with(@acute_rehab)
  end

  def edit
  end

  def create
    @acute_rehab = AcuteRehab.new(acute_rehab_params)
    @acute_rehab.assign_attributes(acute_rehab_params)
    @acute_rehab.save
    @patient.episode_of_cares << @acute_rehab
    @patient.save
    respond_with(@acute_rehab, location: edit_patient_path(@patient))
  end

  def update
    @acute_rehab.assign_attributes(acute_rehab_params)
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
        :start_fim,
        :start_swls,
        :goal_fim,
        :finish_fim,
        :reason_for_admission,
        :reason_for_admission_other,
        :hospital_admission,
        :acute_rehab_admission,
        :hospital_discharge,
        :acute_rehab_discharge,
        :residence_type,
        :residence_name,
        :discharge_to_community,
        :start_sf8,
        :finish_swls,
        :finish_sf8,
        :followup_90day_date,
        :followup_90day_fim,
        :followup_90day_swls,
        :followup_90day_chart_sf,
        :followup_90day_sf8,
        :followup_1yr_date,
        :followup_1yr_fim,
        :followup_1yr_swls,
        :followup_1yr_chart_sf,
        :followup_1yr_sf8,
        start_asia_assessment_attributes: nested_model_attributes(Asia),
        finish_asia_assessment_attributes: nested_model_attributes(Asia),
      )
    end
end
