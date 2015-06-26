class PatientMeetsSpreadsheet < ActiveRecord::Migration
  def change
    create_table "addresses" do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.integer :zip
      t.integer :zip_plus4
      t.string :country

      t.timestamps null: false
    end

    rename_column :patients, :patient_id, :scido_id
    add_column :patients, :gender, :integer

    add_column :patients, :address, :integer
    add_foreign_key :patients, :addresses, column: :address, dependent: :delete

    add_column :patients, :my_healthevet_messaging, :boolean
    add_column :patients, :sci_service_connected, :boolean

    add_column :patients, :travel_status, :integer
    add_column :patients, :benefits_waiver_exemption_date, :date

    add_column :patients, :va_status, :integer

    add_column :patients, :assigned_vamc, :integer
    add_column :patients, :assigned_sci_hub, :integer
    add_column :patients, :assigned_sci_hub_physician_first_name, :string
    add_column :patients, :assigned_sci_hub_physician_last_name, :string

    add_column :patients, :preferred_sci_hub, :integer
    add_column :patients, :preferred_sci_hub_physician_first_name, :string
    add_column :patients, :preferred_sci_hub_physician_last_name, :string

    add_column :patients, :non_va_facility_name, :string
    add_column :patients, :non_va_facility_contact, :string
    add_column :patients, :non_va_facility_phone_number, :string
    add_column :patients, :non_va_facility_fax_number, :string
    add_column :patients, :non_va_facility_pcp_first_name, :string
    add_column :patients, :non_va_facility_pcp_last_name, :string

    add_column :patients, :va_facility, :string
    add_column :patients, :va_facility_pcp_first_name, :string
    add_column :patients, :va_facility_pcp_last_name, :string

    add_column :patients, :theater_of_service, :integer
    add_column :patients, :sci_arrival_date, :date
    add_column :patients, :is_injured_on_active_duty, :boolean
    add_column :patients, :sci_type, :integer

    add_column :patients, :date_of_injury, :date
    add_column :patients, :level_of_injury, :integer
    add_column :patients, :is_asia_complete, :boolean

    add_column :patients, :current_occupation, :string

    add_column :patients, :residence_type, :integer
    add_column :patients, :residence_name, :string

    add_column :patients, :has_caregiver, :boolean
    add_column :patients, :caregiver_address, :integer
    add_foreign_key :patients, :addresses, column: :caregiver_address, dependent: :delete

    add_column :patients, :is_receiving_non_va_care, :boolean
    add_column :patients, :non_va_care_hours_per_month, :integer
    add_column :patients, :non_va_caregiver_receiving_reimbursement, :string
    add_column :patients, :last_fee_basis_evaluation_date, :date
    add_column :patients, :is_receiving_hhha, :boolean

    remove_column :patients, :sci_region, :string
    remove_column :patients, :asia_impairment, :string
    remove_column :patients, :bladder_drainage, :string
    remove_column :patients, :employment_status, :integer
    remove_column :patients, :registration_status, :integer
    remove_column :patients, :sci_network, :boolean
    remove_column :patients, :sci_network_date_changed, :date
    remove_column :patients, :type_of_etiology, :string
    remove_column :patients, :etiology, :string
    remove_column :patients, :other_etiology, :string
    remove_column :patients, :date_of_onset, :date
    remove_column :patients, :brain_injury, :string
    remove_column :patients, :other_injury, :string
    remove_column :patients, :annual_eval_vamc, :string
    remove_column :patients, :primary_care_vamc, :string
    remove_column :patients, :additional_care_vamc, :string
    remove_column :patients, :primary_care_provider, :string
    remove_column :patients, :annual_eval_received, :date
    remove_column :patients, :annual_eval_next_due, :date
    remove_column :patients, :initial_rehab_site, :string
    remove_column :patients, :initial_rehab_discharge, :date
    remove_column :patients, :date_first_seen_in_va_sci, :date
    remove_column :patients, :service_connected, :boolean
    remove_column :patients, :date_of_death, :date
    remove_column :patients, :outcome_coordinator, :string
  end
end
