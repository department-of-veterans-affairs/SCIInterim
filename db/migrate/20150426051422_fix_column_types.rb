class FixColumnTypes < ActiveRecord::Migration
  def change
    change_column :patients, :employment_status, 'integer USING CAST(employment_status AS integer)'
    change_column :patients, :highest_level_of_education, 'integer USING CAST(highest_level_of_education AS integer)'
    change_column :patients, :registration_status, 'integer USING CAST(registration_status AS integer)'
    change_column :patients, :sci_network, 'boolean USING CAST(sci_network AS boolean)'
    change_column :patients, :sci_network_date_changed, 'date USING CAST(sci_network_date_changed AS date)'
    change_column :patients, :date_of_onset, 'date USING CAST(date_of_onset AS date)'
    change_column :patients, :annual_eval_received, 'date USING CAST(annual_eval_received AS date)'
    change_column :patients, :annual_eval_next_due, 'date USING CAST(annual_eval_next_due AS date)'
    change_column :patients, :initial_rehab_discharge, 'date USING CAST(initial_rehab_discharge AS date)'
    change_column :patients, :data_first_seen_in_va_sci, 'date USING CAST(data_first_seen_in_va_sci AS date)'
    change_column :patients, :service_connected, 'boolean USING CAST(service_connected AS boolean)'
    change_column :patients, :date_of_death, 'date USING CAST(date_of_death AS date)'
  end
end
