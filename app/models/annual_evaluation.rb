class AnnualEvaluation < ActiveRecord::Base
  include ModelNestable

  belongs_to :patient

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  add_nested_model :fim, 'Fim'
  add_nested_model :kurtzke_edss, 'KurtzkeEdss'

  belongs_to :bladder_drainage_method, class_name: Domain::BladderDrainageMethod

  validates :eval_offered, presence: true

  def episode_date
    if eval_completed.nil?
      eval_offered
    else
      eval_completed
    end
  end
end
