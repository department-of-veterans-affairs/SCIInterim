class Patient < ActiveRecord::Base
  has_many :episode_of_cares

  belongs_to :address, class_name: 'Address'
  accepts_nested_attributes_for :address

  belongs_to :caregiver_address, class_name: 'Address', foreign_key: 'caregiver_address_id'
  accepts_nested_attributes_for :caregiver_address

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's first name"
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's last name"
  validates :scido_id, numericality: { only_integer: true, greater_than: 0, allow_blank: true}
  validates_format_of :ssn, :with => /\d{3}-\d{2}-\d{4}/, message: "Format as 111-22-3333"
  validate :dob_is_valid_date

  enum asia_level: { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4 }
  enum gender: { "Female" => 1, "Male" => 2, "Unknown" => 3 }
  enum highest_level_of_education: {
    "No Diploma" => 1,
    "High School" => 2,
    "Some College" => 3,
    "Graduate School" => 4
  }
  enum level_of_injury: {
    "C2" => 1,
    "C3" => 2,
    "C4" => 3,
    "C5" => 4,
    "C6" => 5,
    "C7" => 6,
    "C8" => 7,
    "T1" => 8,
    "T2" => 9,
    "T3" => 10,
    "T4" => 11,
    "T5" => 12,
    "T6" => 13,
    "T7" => 14,
    "T8" => 15,
    "T9" => 16,
    "T10" => 17,
    "T11" => 18,
    "T12" => 19,
    "L1" => 20,
    "L2" => 21,
    "L3" => 22,
    "L4" => 23,
    "L5" => 24,
    "S1" => 25,
    "S2" => 26,
    "S3" => 27,
    "S4-5" => 28
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

