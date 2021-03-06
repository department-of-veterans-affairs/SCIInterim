require 'csv'

class Patient < ActiveRecord::Base
  include AttributeExportable, ModelNestable

  attr_accessor :change_in_asia

  has_many :annual_evaluations
  has_many :omrs
  has_many :acute_rehabs

  add_nested_model [:address, :caregiver_address], 'Address'
  add_nested_model :asia, 'Asia'

  belongs_to :assigned_vamc, class_name: Domain::VaMedicalCenter
  belongs_to :assigned_sci_hub, class_name: Domain::SciHub
  belongs_to :current_occupation, class_name: Domain::Occupation
  belongs_to :ethnic, class_name: Domain::Ethnic
  belongs_to :gender, class_name: Domain::Gender
  belongs_to :has_caregiver, class_name: Domain::CaregiverType
  belongs_to :highest_level_of_education, class_name: Domain::HighestLevelOfEducation
  belongs_to :occupation_at_time_of_injury, class_name: Domain::Occupation
  belongs_to :preferred_sci_hub, class_name: Domain::SciHub
  belongs_to :principle_pcp_va_nonva, class_name: Domain::PrinciplePcpType
  belongs_to :residence_type, class_name: Domain::ResidenceType
  belongs_to :sci_type, class_name: Domain::SciType
  belongs_to :scid_eligibility, class_name: Domain::ScidEligibility
  belongs_to :scid_etiology, class_name: Domain::ScidEtiology
  belongs_to :theater_of_service, class_name: Domain::TheaterOfService
  belongs_to :travel_status, class_name: Domain::TravelStatus
  belongs_to :va_facility, class_name: Domain::VaMedicalCenter
  belongs_to :va_status, class_name: Domain::VaStatus
  belongs_to :race, class_name: Domain::Race
  belongs_to :scid_ms_eligibility, class_name: Domain::ScidMsEligibility

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's first name"
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's last name"
  validates :scido_id, numericality: { only_integer: true, greater_than: 0, allow_blank: true}
  validates_format_of :ssn, :with => /\d{3}-\d{2}-\d{4}/, message: "Format as 111-22-3333"
  validate :dob_is_valid_date
  validates_presence_of :ethnic_id, :race_id, :gender_id, :registration_date
  validates_presence_of :scid_ms_eligibility_id, :if => :scid_eligibility_ms?
  
  before_validation :ms_eligibility_for_ms_only, :registration_date_today

  def ms_eligibility_for_ms_only
    self.scid_ms_eligibility_id = nil unless scid_eligibility_ms?
  end

  def registration_date_today
    self.registration_date = Date.today if registration_date.nil?
  end

  def scid_eligibility_ms?
    ms = Domain::ScidEligibility.find_by_name("MS")
    ms.present? && ms.id == scid_eligibility_id
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
