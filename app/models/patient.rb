require 'csv'

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

  def self.collections
    {
      assigned_vamc: Domain::VaMedicalCenter.collection,
      current_occupation: Domain::Occupation.collection,
      gender: Domain::Gender.collection,
      has_caregiver: Domain::CaregiverType.collection,
      highest_level_of_education: Domain::HighestLevelOfEducation.collection,
      occupation_at_time_of_injury: Domain::Occupation.collection,
      principle_pcp_va_nonva: Domain::PrinciplePcpType.collection,
      residence_type: Domain::ResidenceType.collection,
      sci_type: Domain::SciType.collection,
      scid_eligibility: Domain::ScidEligibility.collection,
      scid_etiology: Domain::ScidEtiology.collection,
      theater_of_service: Domain::TheaterOfService.collection,
      travel_status: Domain::TravelStatus.collection,
      va_facility: Domain::VaMedicalCenter.collection,
      va_status: Domain::VaStatus.collection,
    }.with_indifferent_access
  end

  def computed_age
    age = Date.today.year - dob.year
    age -= 1 if Date.today < dob + age.years
    return age
  end

  def dob_is_valid_date
    errors.add(:dob, 'must be a valid date') if (!dob.is_a?(Date))
  end

  def self.as_csv
    CSV.generate do |csv|
      columns = %w(first_name last_name ssn) 
      csv << ["First Name", "Last Name", "SSN", "Facility"]
      all.each do |item|
        csv << [item.first_name, item.last_name, item.ssn, Domain::VaMedicalCenter.find(item.assigned_vamc).name]
      end
    end
  end
end
