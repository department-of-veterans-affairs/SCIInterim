class AcuteRehab < ActiveRecord::Base
  belongs_to :patient

  has_many :transfers, dependent: :destroy
  accepts_nested_attributes_for :transfers, :reject_if => lambda { |t| t[:in].blank? && t[:out].blank? && t[:location].blank? }, :allow_destroy => true
  validates_associated :transfers

  has_one :start_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :start_asia_assessment
  validates_associated :start_asia_assessment

  has_one :finish_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :finish_asia_assessment
  validates_associated :finish_asia_assessment

  belongs_to :start_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :start_sf8
  validates_associated :start_sf8

  belongs_to :finish_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :finish_sf8
  validates_associated :finish_sf8

  belongs_to :followup_90day_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :followup_90day_sf8
  validates_associated :followup_90day_sf8

  belongs_to :followup_1year_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :followup_1year_sf8
  validates_associated :followup_1year_sf8

  def episode_date
    acute_rehab_admission
  end

  def self.collections
    {
      reason_for_admission: Domain::ReasonForAdmission.collection,
      discharge_location: Domain::ResidenceType.collection,
    }.with_indifferent_access
  end
end
