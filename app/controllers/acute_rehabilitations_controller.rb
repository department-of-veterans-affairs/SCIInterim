class AcuteRehabilitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:new, :create]
  before_action :set_acute_rehabilitation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @acute_rehabilitations = AcuteRehabilitation.all
    respond_with(@acute_rehabilitations)
  end

  def show
    respond_with(@acute_rehabilitation)
  end

  def new
    @acute_rehabilitation = AcuteRehabilitation.new
    respond_with(@acute_rehabilitation)
  end

  def edit
  end

  def create
    @acute_rehabilitation = AcuteRehabilitation.new(acute_rehabilitation_params)
    @acute_rehabilitation.save
    @patient.episode_of_cares << @acute_rehabilitation
    @patient.save
    respond_with(@acute_rehabilitation)
  end

  def update
    @acute_rehabilitation.update(acute_rehabilitation_params)
    respond_with(@acute_rehabilitation)
  end

  def destroy
    @acute_rehabilitation.destroy
    respond_with(@acute_rehabilitation)
  end

  private
    def set_acute_rehabilitation
      @acute_rehabilitation = AcuteRehabilitation.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def acute_rehabilitation_params
      params.require(:acute_rehabilitation).permit(
        :patient_id,
        :episode_date,
        :fake_sadness
      )
    end
end
