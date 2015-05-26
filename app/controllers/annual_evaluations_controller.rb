class AnnualEvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_annual_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @annual_evaluation = AnnualEvaluation.new
    respond_with(@annual_evaluation)
  end

  def edit
  end

  def create
    @annual_evaluation = AnnualEvaluation.new(annual_evaluation_params)
    @annual_evaluation.save
    @patient.episode_of_cares << @annual_evaluation
    @patient.save
    respond_with(@annual_evaluation, location: edit_patient_path(@patient))
  end

  def update
    @annual_evaluation.update(annual_evaluation_params)
    respond_with(@annual_evaluation, location: edit_patient_path(@patient))
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
        :patient_id,
        :episode_date,
        :asia_level
      )
    end
end
