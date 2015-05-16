class Omr1YearsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create]
  before_action :set_omr1_year, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @omr1_years = Omr1Year.all
    respond_with(@omr1_years)
  end

  def new
    @omr1_year = Omr1Year.new
    respond_with(@omr1_year)
  end

  def edit
  end

  def create
    @omr1_year = Omr1Year.new(omr1_year_params)
    @omr1_year.save
    @patient.episode_of_cares << @omr1_year
    @patient.save
    respond_with(@omr1_year)
  end

  def update
    @omr1_year.update(omr1_year_params)
    respond_with(@omr1_year)
  end

  private
    def set_omr1_year
      @omr1_year = Omr1Year.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def omr1_year_params
      params.require(:omr1_year).permit(
        :patient_id, # TODO(awong.dev): Required?
        :episode_date, # TODO(awong.dev): Dedup.
        :followup_date,
        :fim,
        :fam,
        :swls,
        :chart_sf,
        :sf_8,
        :place_of_residence,
      )
    end
end
