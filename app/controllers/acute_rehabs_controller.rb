class AcuteRehabsController < ApplicationController
  include AttributeParam 

  layout 'patient_edit'

  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_acute_rehab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    render status: :not_found, text: "Listing all acute rehabs alone is odd"
  end

  def new
    @acute_rehab = AcuteRehab.new
    @acute_rehab.build_start_asia_assessment
    @acute_rehab.build_finish_asia_assessment
    @acute_rehab.build_start_sf8
    @acute_rehab.build_finish_sf8
    @acute_rehab.build_followup_1year_sf8
    @acute_rehab.build_followup_90day_sf8
    @acute_rehab.build_followup_1year_chart_sf
    @acute_rehab.build_followup_90day_chart_sf
    3.times { @acute_rehab.transfers.build }
    respond_with(@acute_rehab)
  end

  def edit
    # Always give an option for adding a new transfer.
    @acute_rehab.transfers.build
  end

  def show
    render :edit
  end

  def create
    @acute_rehab = @patient.acute_rehabs.build
    # TODO(awong): Should this use assign_attributes?
    @acute_rehab.assign_attributes(acute_rehab_params)
    @patient.save
    respond_with(@acute_rehab, location: edit_patient_path(@patient))
  end

  def update
    @acute_rehab.update(acute_rehab_params)
    respond_with(@acute_rehab, location: edit_patient_path(@patient))
  end

  def destroy
    render status: :forbidden, text: "Deleting an Acute Rehab is not allowed"
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
        :acute_rehab_admission,
        :acute_rehab_discharge,
        :discharge_location_id,
        :discharge_to_community,
        :finish_fim,
        :finish_sf8,
        :finish_swls,
        :followup_1yr_chart_sf,
        :followup_1yr_date,
        :followup_1yr_fim,
        :followup_1yr_sf8,
        :followup_1yr_swls,
        :followup_90day_chart_sf,
        :followup_90day_date,
        :followup_90day_fim,
        :followup_90day_sf8,
        :followup_90day_swls,
        :goal_fim,
        :hospital_admission,
        :hospital_discharge,
        :patient_id, # TODO(awong.dev): Required?
        :reason_for_admission_id,
        :reason_for_admission_other,
        :residence_type,
        :start_fim,
        :start_sf8,
        :start_swls,
        start_asia_assessment_attributes: nested_model_attributes(Asia),
        finish_asia_assessment_attributes: nested_model_attributes(Asia),
        transfers_attributes: nested_model_attributes(Transfer),
        start_sf8_attributes: nested_model_attributes(Sf8),
        finish_sf8_attributes: nested_model_attributes(Sf8),
        followup_90day_sf8_attributes: nested_model_attributes(Sf8),
        followup_1year_sf8_attributes: nested_model_attributes(Sf8),
        followup_90day_chart_sf_attributes: nested_model_attributes(ChartSf),
        followup_1year_chart_sf_attributes: nested_model_attributes(ChartSf),
      )
    end
end
