require 'benchmark'

class OmrsController < ApplicationController
  include AttributeParam 

  layout 'patient_edit'

  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_omr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    render status: :not_found, text: "Listing all OMRS is odd"
  end

  def new
    @omr = Omr.new

    @omr.build_start_asia(
      has_motor_or_sensory_asymmetry: true    )

    @omr.build_finish_asia(
      has_motor_or_sensory_asymmetry: true
    )

    @omr.build_finish_chart_sf
    @omr.build_finish_sf8
    @omr.build_followup_1yr_chart_sf
    @omr.build_followup_1yr_sf8
    @omr.build_followup_90day_chart_sf
    @omr.build_followup_90day_sf8
    @omr.build_start_chart_sf
    @omr.build_start_sf8
    respond_with(@omr)
  end

  def show
    render :edit
  end

  def edit
  end

  def create
    @omr = @patient.omrs.build
    # TODO(awong): Should this use assign_attributes?
    @omr.assign_attributes(omr_params)
    @patient.save
    respond_with(@omr, location: edit_patient_path(@patient))
  end

  def update
    @omr.update(omr_params)
    respond_with(@omr, location: edit_patient_path(@patient))
  end

  def destroy
    render status: :forbidden, text: "Deleting an OMR is not allowed"
  end

  private
    def set_omr
      #@omr = Omr.find(params[:id])
      @omr = Omr.includes(
        :start_asia, :finish_asia,
        :start_chart_sf, :finish_chart_sf, :followup_90day_chart_sf, :followup_1yr_chart_sf,
        :start_sf8, :finish_sf8, :followup_90day_sf8, :followup_1yr_sf8).find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def omr_params
      params.require(:patient_id)
      params.require(:omr).permit(
        :discharge_location_id,
        :finish_date,
        :finish_swls,
        :followup_1yr_date,
        :followup_90day_date,
        :start_date,
        :start_hub_id,
        :start_swls,
        finish_asia_attributes: nested_model_attributes(Asia),
        finish_chart_sf_attributes: nested_model_attributes(ChartSf),
        finish_sf8_attributes: nested_model_attributes(Sf8),
        followup_1yr_chart_sf_attributes: nested_model_attributes(ChartSf),
        followup_1yr_sf8_attributes: nested_model_attributes(Sf8),
        followup_90day_chart_sf_attributes: nested_model_attributes(ChartSf),
        followup_90day_sf8_attributes: nested_model_attributes(Sf8),
        start_asia_attributes: nested_model_attributes(Asia),
        start_chart_sf_attributes: nested_model_attributes(ChartSf),
        start_sf8_attributes: nested_model_attributes(Sf8),
      )
    end
end
