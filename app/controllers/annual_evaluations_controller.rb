class AnnualEvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_annual_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @annual_evaluations = AnnualEvaluation.all
    respond_with(@annual_evaluations)
  end

  def show
    respond_with(@annual_evaluation)
  end

  def new
    @annual_evaluation = AnnualEvaluation.new
    respond_with(@annual_evaluation)
  end

  def edit
  end

  def create
    @annual_evaluation = AnnualEvaluation.new(annual_evaluation_params)
    @annual_evaluation.save
    respond_with(@annual_evaluation)
  end

  def update
    @annual_evaluation.update(annual_evaluation_params)
    respond_with(@annual_evaluation)
  end

  def destroy
    @annual_evaluation.destroy
    respond_with(@annual_evaluation)
  end

  private
    def set_annual_evaluation
      @annual_evaluation = AnnualEvaluation.find(params[:id])
    end

    def annual_evaluation_params
      params[:annual_evaluation]
    end
end
