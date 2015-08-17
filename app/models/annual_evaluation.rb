class AnnualEvaluation < ActiveRecord::Base
  belongs_to :patient

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  belongs_to :fim, class_name: 'Fim'
  accepts_nested_attributes_for :fim
  validates_associated :fim

  def episode_date
    if eval_completed.nil?
      eval_offered
    else
      eval_completed
    end
  end

  def self.collections
    {
      is_inpatient: [ ["Inpatient", true], ["Outpatient", false] ],
      bladder_drainage_method: Domain::BladderDrainageMethod.collection,
    }.with_indifferent_access
  end
end
