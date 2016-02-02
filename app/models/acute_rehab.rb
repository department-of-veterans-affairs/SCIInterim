class AcuteRehab < ActiveRecord::Base
  include AttributeExportable, ModelNestable

  belongs_to :patient
  belongs_to :start_hub, class_name: Domain::SciHub

  has_many :transfers, dependent: :destroy
  accepts_nested_attributes_for :transfers, :reject_if => lambda { |t| t[:in].blank? && t[:out].blank? && t[:location].blank? }, :allow_destroy => true
  
  validates_associated :transfers

  add_nested_model [:start_asia, :finish_asia], 'Asia'
  add_nested_model [:start_sf8, :finish_sf8, :followup_90day_sf8, :followup_1year_sf8], 'Sf8'
  add_nested_model [:followup_90day_chart_sf, :followup_1year_chart_sf], 'ChartSf'

  belongs_to :discharge_location, class_name: Domain::ResidenceType
  belongs_to :reason_for_admission, class_name: Domain::ReasonForAdmission

  validates :acute_rehab_admission, presence: true

  def episode_date
    acute_rehab_admission
  end
end
