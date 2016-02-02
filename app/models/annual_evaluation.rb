class AnnualEvaluation < ActiveRecord::Base
  include AttributeExportable, ModelNestable

  attr_accessor :change_in_asia
  
  belongs_to :patient

  add_nested_model :asia, 'Asia'
  add_nested_model :fim, 'Fim'
  add_nested_model :kurtzke_edss, 'KurtzkeEdss'

  belongs_to :bladder_drainage_method, class_name: Domain::BladderDrainageMethod
  belongs_to :offered_hub, class_name: Domain::SciHub
  belongs_to :completed_hub, class_name: Domain::SciHub

  validates :ae_received, inclusion: { in: [true, false] }
  validates :eval_completed, :completed_hub_id, presence: true, if: "ae_received"
  validates :eval_offered, presence: true
  validates :height_inches, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999, only_integer: true, allow_blank: true }
  validates :weight_lbs, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99, only_integer: true, allow_blank: true }

  # TODO(awong): Ensure virtual attributes like this show up in reports.
  def bmi
    if !height_inches.nil? && !weight_lbs.nil?
      (weight_lbs * 703.0 / (height_inches * height_inches)).round(2)
    else
      nil
    end
  end

  def episode_date
    if eval_completed.nil?
      eval_offered
    else
      eval_completed
    end
  end
end
