require 'csv'

class Patient < ActiveRecord::Base
  has_many :annual_evaluations
  has_many :omrs
  has_many :acute_rehabs

  belongs_to :address, class_name: 'Address'
  accepts_nested_attributes_for :address

  belongs_to :caregiver_address, class_name: 'Address', foreign_key: 'caregiver_address_id'
  accepts_nested_attributes_for :caregiver_address

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  belongs_to :assigned_vamc, class_name: Domain::VaMedicalCenter
  belongs_to :assigned_sci_hub, class_name: Domain::SciHub
  belongs_to :current_occupation, class_name: Domain::Occupation
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

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's first name"
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "Enter the patient's last name"
  validates :scido_id, numericality: { only_integer: true, greater_than: 0, allow_blank: true}
  validates_format_of :ssn, :with => /\d{3}-\d{2}-\d{4}/, message: "Format as 111-22-3333"
  validate :dob_is_valid_date

  def episode_of_cares
    all_episodes = []
    all_episodes.push(*annual_evaluations)
    all_episodes.push(*acute_rehabs)
    all_episodes.push(*omrs)
    all_episodes.sort! do |a, b|
      # TODO(awong): Remove the nil? checks by enforcing non-nill in DB.
      if a.episode_date.nil?
        if b.episode_date.nil?
          0
        else
          -1
        end
      elsif b.episode_date.nil?
        1
      else
        a.episode_date <=> b.episode_date
      end
    end
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
