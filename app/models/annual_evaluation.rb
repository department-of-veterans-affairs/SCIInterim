class AnnualEvaluation < ActiveRecord::Base
  acts_as :episode_of_care

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  belongs_to :fim, class_name: 'Fim'
  accepts_nested_attributes_for :fim
  validates_associated :fim

  def self.collections
    {
      is_inpatient: [ ["Inpatient", true], ["Outpatient", false] ],
      bladder_drainage_method: Domain::BladderDrainageMethod.collection,
    }.with_indifferent_access
  end
end
