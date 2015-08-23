class OmrsController < ApplicationController
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
      @omr = Omr.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def omr_params
      params.require(:omr).permit(
        :patient_id, # TODO(awong.dev): Required?
        :admission_date,
        :start_asia,
        :start_fim,
        :start_fam,
        :start_swls,
        :start_chart_sf,
        :start_sf_8,
        :dusoi,

        # GOAL
        :goal_fim,
        :goal_fam,

        # FINISH
        :omb_completed,
        :finish_asia,
        :finish_fim,
        :finish_fam,
        :finish_swls,
        :finish_chart_sf,
        :finish_sf_8,
        :finish_uspeq,
        :discharge_location)
    end
end
