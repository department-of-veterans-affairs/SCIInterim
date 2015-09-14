class AnnualEvaluationsController < ApplicationController
  include AttributeParam 

  layout 'patient_edit'

  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_annual_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    render status: :not_found, text: "Listing all annual evaluations is odd"
  end

  def new
    @annual_evaluation = AnnualEvaluation.new
    @annual_evaluation.build_asia_assessment
    @annual_evaluation.build_fim
    @annual_evaluation.fim.build_measurements_start
    @annual_evaluation.fim.build_measurements_goal
    @annual_evaluation.fim.build_measurements_finish
    @annual_evaluation.fim.build_measurements_90day
    @annual_evaluation.fim.build_measurements_1year
    @annual_evaluation.build_kurtzke_edss
    respond_with(@annual_evaluation)
  end

  def show
    render :edit
  end

  def edit
  end

  def create
    @annual_evaluation = @patient.annual_evaluations.build
    # TODO(awong): Should this use assign_attributes?
    @annual_evaluation.assign_attributes(annual_evaluation_params)
    @patient.save
    respond_with(@annual_evaluation, location: edit_patient_path(@patient))
  end

  def update
    @annual_evaluation.update_attributes(annual_evaluation_params)
    @annual_evaluation.update(annual_evaluation_params)
    respond_with(@annual_evaluation, location: edit_patient_path(@patient))
  end

  def destroy
    render status: :forbidden, text: "Deleting an Annual Evaluation is not allowed"
  end

  private
    def set_annual_evaluation
      @annual_evaluation = AnnualEvaluation.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def annual_evaluation_params
      params.require(:annual_evaluation).permit(
        :bladder_drainage_method_id,
        :bmi,
        :completed_hub_id,
        :eval_completed,
        :eval_offered,
        :is_inpatient,
        :offered_hub_id,
        :patient_id,
        asia_assessment_attributes: nested_model_attributes(Asia),
        fim_attributes: nested_model_attributes(Fim).concat([
          {"measurements_start_attributes" => nested_model_attributes(FimMeasurement)},
          {"measurements_goal_attributes" => nested_model_attributes(FimMeasurement)},
          {"measurements_finish_attributes" => nested_model_attributes(FimMeasurement)},
          {"measurements_90day_attributes" => nested_model_attributes(FimMeasurement)},
          {"measurements_1year_attributes" => nested_model_attributes(FimMeasurement)},
          ]),
        kurtzke_edss_attributes: nested_model_attributes(KurtzkeEdss),
      )
    end
end
