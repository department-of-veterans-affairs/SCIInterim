class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @query = params[:query]

    if (@query)
      @patients = Patient.where(patient_id: params[:query])
      if @patients.empty?
        @patients = Patient.where("name LIKE :prefix", prefix: "%#{params[:query]}%")
      end
    else
      @patients = Patient.all
    end

    respond_with(@patients)
  end

  def new
    @patient = Patient.new
    respond_with(@patient)
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "You have successfully created a patient."
      render :edit
    else
      flash[:error] = "Something went wrong when creating this patient. Please try again."
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      flash[:success] = "You have successfully updated this patient's data"
    else
      flash[:error] = "Something went wrong updating this patient's data. Try again."
    end
    render :edit
  end

  def destroy
    render :nothing => true, :status => 400
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :patient_id, :name, :ssn, :dob,
        :asia_level, :asia_impairment,
        :bladder_drainage, :employment_status,
        :highest_level_of_education,
        :registration_status, :sci_network,
        :sci_network_date_changed,
        :type_of_etiology, :etiology,
        :other_etiology, :date_of_onset,
        :brain_injury, :other_injury,
        :annual_eval_vamc, :primary_care_vamc,
        :additional_care_vamc, :primary_care_provider,
        :annual_eval_received, :annual_eval_next_due,
        :initial_rehab_site, :initial_rehab_discharge,
        :data_first_seen_in_va_sci, :occupation_at_time_of_injury,
        :service_connected, :date_of_death, :outcome_coordinator)
    end
end
