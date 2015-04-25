class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @patients = Patient.all
    respond_with(@patients)
  end

  def show
    respond_with(@patient)
  end

  def new
    @patient = Patient.new
    respond_with(@patient)
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    respond_with(@patient)
  end

  def update
    @patient.update(patient_params)
    respond_with(@patient)
  end

  def destroy
    @patient.destroy
    respond_with(@patient)
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
