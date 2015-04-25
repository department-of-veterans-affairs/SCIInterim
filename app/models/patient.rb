class Patient < ActiveRecord::Base
  def self.to_display_name(symbol)
    return symbol.to_s.split('_').join(' ').titleize
  end
  def self.fields
    [
      [ :patient_id, :integer ],
      [ :name, :string ],
      [ :ssn, :string ],
      [ :dob, :datetime ],
      [ :asia_level, :string ],
      [ :asia_impairment, :string ],
      [ :bladder_drainage, :string ],
      [ :employment_status, :string ],
      [ :highest_level_of_education, :string ],
      [ :registration_status, :string ],
      [ :sci_network, :string ],
      [ :sci_network_date_changed, :datetime ],
      [ :type_of_etiology, :string ],
      [ :etiology, :string ],
      [ :other_etiology, :string ],
      [ :date_of_onset, :datetime ],
      [ :brain_injury, :string ],
      [ :other_injury, :string ],
      [ :annual_eval_vamc, :string ],
      [ :primary_care_vamc, :string ],
      [ :additional_care_vamc, :string ],
      [ :primary_care_provider, :string ],
      [ :annual_eval_received, :datetime ],
      [ :annual_eval_next_due, :datetime ],
      [ :initial_rehab_site, :string ],
      [ :initial_rehab_discharge, :datetime ],
      [ :data_first_seen_in_va_sci, :string ],
      [ :occupation_at_time_of_injury, :string ],
      [ :service_connected, :string ],
      [ :date_of_death, :datetime ],
      [ :outcome_coordinator, :string ],
    ]
  end
end
