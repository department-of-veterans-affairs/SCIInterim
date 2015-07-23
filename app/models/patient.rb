class Patient < ActiveRecord::Base
  has_many :episode_of_cares

  belongs_to :address, class_name: 'Address'
  accepts_nested_attributes_for :address

  belongs_to :caregiver_address, class_name: 'Address', foreign_key: 'caregiver_address_id'
  accepts_nested_attributes_for :caregiver_address

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's first name"
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's last name"
  validates :scido_id, numericality: { only_integer: true, greater_than: 0, allow_blank: true}
  validates_format_of :ssn, :with => /\d{3}-\d{2}-\d{4}/, message: "Format as 111-22-3333"
  validate :dob_is_valid_date

  enum gender: { "Female" => 1, "Male" => 2, "Unknown" => 3 }
  enum highest_level_of_education: {
    "No Diploma" => 1,
    "High School" => 2,
    "Some College" => 3,
    "Graduate School" => 4
  }
  enum sci_type: {
    "Unknown SCI" => 1,
    "High Tetraplegic" => 2,
    "Low Tetraplegic" => 3,
    "Paraplegic" => 4
  }
  enum travel_status: {
    "Not Eligible" => 1,
    ">=30% more" => 2,
    "VA pension" => 3,
    "Benefit Travel Waiver" => 4
  }
  enum theater_of_service: {
    "NONE" => 1,
    "OEF/OIF" => 2,
    "OND" => 3
  }
  enum va_status: {
    "Active" => 1,
    "Deactivate" => 2,
    "On-Hold" => 3,
    "Expired" => 4
  }
  enum residence_type: {
    "Own" => 1,
    "Rent" => 2,
    "Homeless" => 3,
    "Assisted living" => 4,
    "Nursing home" => 5,
    "Shelter" => 6,
    "Group Home" => 7,
    "Board and Care" => 8,
  }
  enum has_caregiver: {
    "No Caregiver" => 1,
    "Paid Family" => 2,
    "Unpaid Family" => 3,
    "Paid Non-family" => 4,
    "Unpaid Non-family" => 5,
  }
  # This needs love and is very sad
  enum occupation_at_time_of_injury: {
    "Working (competitive labor market, includes military) at time of injury" => 1,
    "Homemaker at time of injury" => 2, 
    "On-th-job training at time of injury" => 3, 
    "Sheltered workshop at time of injury" => 4,
    "Student at time of injury"  => 5,
    "Unemployed (may or may not be looking for work) at time of injury"  => 6,
    "Other, unclassified (includes volunteer, disability or medical leave) at time of injury"  => 7,
    "Unknown occupation at time of injury" => 8
  }
  enum current_occupation: {
    "Working (competitive labor market, includes military)" => 1,
    "Homemaker" => 2, 
    "On-th-job training" => 3, 
    "Sheltered workshop" => 4,
    "Student" => 5,
    "Unemployed (may or may not be looking for work)" => 6,
    "Other, unclassified (includes volunteer, disability or medical leave)" => 7,
    "Unknown current occupation" => 8
  }
  enum scid_etiology: {
    "Sports" => 1,
    "Assault" => 2,
    "Transport" => 3,
    "Fall" => 4,
    "Other traumatic cause" => 5,
    "Non-traumatic spinal cord dysfunction" => 6,
    "Unspecified or Unknown" => 7
  } 
  enum scid_eligibility: {
    "SCI" => 1, 
    "MS" => 2,
    "ALS" => 3, 
    "other" => 4
  }
  enum principle_pcp_va_nonva: { "VA" => 1, "NonVA" => 2, "Other" => 3 }

  def computed_age
    age = Date.today.year - dob.year
    age -= 1 if Date.today < dob + age.years
    return age
  end

  def dob_is_valid_date
    errors.add(:dob, 'must be a valid date') if (!dob.is_a?(Date))
  end
end

