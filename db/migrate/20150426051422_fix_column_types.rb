class FixColumnTypes < ActiveRecord::Migration
  def change
    change_column :patients, :employment_status, :integer
    change_column :patients, :highest_level_of_education, :integer
    change_column :patients, :registration_status, :integer
    change_column :patients, :sci_network, :boolean
    change_column :patients, :sci_network_date_changed, :date
    change_column :patients, :date_of_onset, :date
    change_column :patients, :annual_eval_received, :date
    change_column :patients, :annual_eval_next_due, :date
    change_column :patients, :initial_rehab_discharge, :date
    change_column :patients, :data_first_seen_in_va_sci, :date
    change_column :patients, :service_connected, :boolean
    change_column :patients, :date_of_death, :date
  end
end
