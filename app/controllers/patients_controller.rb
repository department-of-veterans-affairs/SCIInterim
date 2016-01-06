class PatientsController < ApplicationController
  include AttributeParam 

  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @query = params[:query]

    if (@query)
      @patients = Patient.where(id: params[:query])
      if @patients.empty?
        @patients = Patient.where("first_name LIKE :query or last_name LIKE :query or ssn LIKE :query", query: "%#{params[:query]}%")
      end
    else
      @patients = Patient.all
    end
    respond_to do |format|
        format.html {respond_with(@patients)}
        format.csv { send_data @patients.as_csv }
        format.json { send_data @patients.to_json }
    end
  end

  def show
    render :edit, layout: 'patient_edit'
  end

  def new
    @patient = Patient.new
    @patient.build_address
    @patient.build_asia
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

  def episode_of_care_sort_func(a, b)
    # TODO(awong): Only one should ever be nil. This occurs if
    # data validation fails. Try to simplify this logic for nil.
    if a.episode_date.nil?
      if b.episode_date.nil?
        0
      else
        -1
      end
    elsif b.episode_date.nil?
      1
    else
      b.episode_date <=> a.episode_date
    end
  end
  helper_method :episode_of_care_sort_func

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :assigned_sci_hub_id,
        :assigned_sci_hub_physician_first_name,
        :assigned_sci_hub_physician_last_name,
        :assigned_vamc_id,
        :benefits_waiver_exemption_date,
        :caregiver_first_name,
        :caregiver_last_name,
        :current_occupation_id,
        :date_of_injury,
        :dob,
        :ethnic_id,
        :first_name,
        :gender_id,
        :has_caregiver_id,
        :highest_level_of_education_id,
        :is_on_active_duty,
        :is_receiving_hhha,
        :is_receiving_non_va_care,
        :last_fee_basis_evaluation_date,
        :last_name,
        :my_healthevet_messaging,
        :non_va_care_hours_per_month,
        :non_va_caregiver_receiving_reimbursement,
        :non_va_facility_fax_number,
        :non_va_facility_name,
        :non_va_facility_pcp_first_name,
        :non_va_facility_pcp_last_name,
        :non_va_facility_phone_number,
        :notes,
        :occupation_at_time_of_injury_id,
        :preferred_sci_hub_id,
        :preferred_sci_hub_physician_first_name,
        :preferred_sci_hub_physician_last_name,
        :principle_pcp_va_nonva_id,
        :race_id,
        :residence_type_id,
        :sci_arrival_date,
        :sci_service_connected,
        :sci_type_id,
        :scid_eligibility_id,
        :scid_eligibility_other,
        :scid_etiology_id,
        :scid_ms_eligibility_id,
        :scido_id,
        :ssn,
        :theater_of_service_id,
        :travel_status_id,
        :va_facility_id,
        :va_facility_pcp_first_name,
        :va_facility_pcp_last_name,
        :va_status_id,
        address_attributes: nested_model_attributes(Address),
        asia_attributes: nested_model_attributes(Asia),
        caregiver_address_attributes: nested_model_attributes(Address),
        )
    end
end
