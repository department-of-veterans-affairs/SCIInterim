class AcuteRehab < ActiveRecord::Base
  acts_as :episode_of_care
  has_many :transfers, dependent: :destroy

  has_one :start_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :start_asia_assessment
  validates_associated :start_asia_assessment

  has_one :finish_asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :finish_asia_assessment
  validates_associated :finish_asia_assessment

  def self.collections
    {
      reason_for_admission: Domain::ReasonForAdmission.collection,
      residence_type: Domain::ResidenceType.collection,
    }.with_indifferent_access
  end
end
