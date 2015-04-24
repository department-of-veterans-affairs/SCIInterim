class AddSciPatientFields < ActiveRecord::Migration
  def change
    add_column :patients, :sci_region, :string
    add_column :patients, :asia_level, :string
    add_column :patients, :asia_impairment, :string
    add_column :patients, :bladder_drainage, :string
    add_column :patients, :employment_status, :string
    add_column :patients, :highest_level_of_education, :string
    add_column :patients, :registration_status, :string
    add_column :patients, :sci_network, :string
    add_column :patients, :sci_network_date_changed, :datetime
    add_column :patients, :type_of_etiology, :string
    add_column :patients, :etiology, :string
    add_column :patients, :other_etiology, :string
    add_column :patients, :date_of_onset, :datetime
    add_column :patients, :brain_injury, :string
    add_column :patients, :other_injury, :string
    add_column :patients, :annual_eval_vamc, :string
    add_column :patients, :primary_care_vamc, :string
    add_column :patients, :additional_care_vamc, :string
    add_column :patients, :primary_care_provider, :string
    add_column :patients, :annual_eval_received, :datetime
    add_column :patients, :annual_eval_next_due, :datetime
    add_column :patients, :initial_rehab_site, :string
    add_column :patients, :initial_rehab_discharge, :datetime
    add_column :patients, :data_first_seen_in_va_sci, :string
    add_column :patients, :occupation_at_time_of_injury, :string
    add_column :patients, :service_connected, :string
    add_column :patients, :date_of_death, :datetime
    add_column :patients, :outcome_coordinator, :string
  end
end
