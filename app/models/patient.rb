class Patient < ActiveRecord::Base
  has_many :episode_of_cares

  validates_format_of :patient_id, :with => /\d+/, message: "Must be a number"
  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "No numbers or special chars"
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "No numbers or special chars"
  validates_format_of :ssn, :with => /\d{3}-\d{2}-\d{3}/, message: "Expect format 111-22-3333"

  enum employment_status: [ :Employed, :Unemployed ]
  enum highest_level_of_education: [ :"No Diploma", :"High School", :"Some College", :"Graduate School" ]
  enum registration_status: [ :"Currently Served", :"Not Served" ]
  enum sci_network: { Yes: true, No: false }
  
  enum asia_level: (2..8).map { |level| "C#{level}" } + (1..12).map {|level| "T#{level}"} + (1..5).map {|level| "L#{level}"} + (1..3).map {|level| "S#{level}"} + [ :"S4-5" ]
  enum etiology: [:"TFA = Fall", :"TSA = Sports Activity", :"TVE = Vehicular"]

  def self.to_display_name(symbol)
    return symbol.to_s.split('_').join(' ').titleize
  end

  def self.fields
    self.basic_fields + self.detailed_fields + self.assessment_fields
  end

  def self.basic_fields
    [
      [ :patient_id, :integer ],
      [ :first_name, :string ],
      [ :last_name, :string ],
      [ :ssn, :string ],
      [ :dob, :date ],
      [ :employment_status, :enum ],
      [ :highest_level_of_education, :enum ],
      [ :registration_status, :enum ],
      [ :sci_network, :enum ],
      [ :date_of_death, :date ],
      [ :outcome_coordinator, :string ],
    ]
  end

  def self.assessment_fields
    [
      [ :asia_level, :enum ],
      [ :asia_impairment, :string ],
      [ :bladder_drainage, :string ],
      [ :type_of_etiology, :string ],
      [ :etiology, :enum ],
      [ :other_etiology, :string ],
      [ :date_of_onset, :date ],
      [ :brain_injury, :string ],
      [ :other_injury, :string ],
    ]
  end

  def self.detailed_fields
    [
      [ :sci_network_date_changed, :date ],
      [ :annual_eval_vamc, :string ],
      [ :primary_care_vamc, :string ],
      [ :additional_care_vamc, :string ],
      [ :primary_care_provider, :string ],
      [ :annual_eval_received, :date ],
      [ :annual_eval_next_due, :date ],
      [ :initial_rehab_site, :string ],
      [ :initial_rehab_discharge, :date ],
      [ :date_first_seen_in_va_sci, :date ],
      [ :occupation_at_time_of_injury, :string ],
      [ :service_connected, :string ],
    ]
  end
end
