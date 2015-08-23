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
