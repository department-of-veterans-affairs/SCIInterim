class PatientsController < ApplicationController
  include AttributeParam 

  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @query = params[:query]

    if (@query)
      @patients = Patient.where(patient_id: params[:query])
      if @patients.empty?
        @patients = Patient.where("name LIKE :query or ssn LIKE :query", query: "%#{params[:query]}%")
      end
    else
      @patients = Patient.all
    end
    respond_to do |format|
        format.html {respond_with(@patients)}
        format.csv { send_data @patients.as_csv }
    end
  end

  def show
    render :edit, layout: 'patient_edit'
  end

  def new
    @patient = Patient.new
    @patient.build_address
    @patient.build_asia_assessment
    @patient.build_caregiver_address
    respond_with(@patient)
  end

  def edit
    render layout: 'patient_edit'
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.assign_attributes(patient_params)
    if @patient.save
      flash[:success] = "You have successfully created a patient."
      respond_with(@patient, location: edit_patient_path(@patient))
    else
      flash[:error] = "Something went wrong when creating this patient. Please try again."
      render :new
    end
  end

  def update
    @patient.update_attributes(patient_params)
    if @patient.update(patient_params)
      flash[:success] = "You have successfully updated this patient's data"
    else
      flash[:error] = "Something went wrong updating this patient's data. Try again."
    end
    respond_with(@patient, location: edit_patient_path(@patient))
  end

  def destroy
    render status: :forbidden, text: "Deleting a Patient is not allowed"
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :first_name,
        :last_name,
        :dob,
        :gender,
        :ssn,
        :scido_id,
        :my_healthevet_messaging,
        :sci_service_connected,
        :highest_level_of_education,
        :assigned_vamc,
        :travel_status,
        :benefits_waiver_exemption_date,
        :assigned_sci_hub,
        :assigned_sci_hub_physician_first_name,
        :assigned_sci_hub_physician_last_name,
        :preferred_sci_hub,
        :preferred_sci_hub_physician_first_name,
        :preferred_sci_hub_physician_last_name,
        :principle_pcp_va_nonva,
        :non_va_facility_name,
        :non_va_facility_phone_number,
        :non_va_facility_fax_number,
        :non_va_facility_pcp_first_name,
        :non_va_facility_pcp_last_name,
        :scid_eligibility,
        :scid_eligibility_other,
        :scid_etiology,
        :va_facility,
        :va_facility_pcp_first_name,
        :va_facility_pcp_last_name,
        :theater_of_service,
        :sci_arrival_date,
        :is_on_active_duty,
        :sci_type,
        :date_of_injury,
        :highest_level_of_education,
        :occupation_at_time_of_injury,
        :current_occupation,
        :residence_type,
        :has_caregiver,
        :caregiver_first_name,
        :caregiver_last_name,
        :is_receiving_non_va_care,
        :non_va_care_hours_per_month,
        :last_fee_basis_evaluation_date,
        :non_va_caregiver_receiving_reimbursement,
        :is_receiving_hhha,
        address_attributes: nested_model_attributes(Address),
        asia_assessment_attributes: nested_model_attributes(Asia),
        caregiver_address_attributes: nested_model_attributes(Address),
        )
    end
end
