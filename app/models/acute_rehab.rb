class AcuteRehab < ActiveRecord::Base
  include ModelNestable

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

  add_nested_model [:start_sf8, :finish_sf8, :followup_90day_sf8, :followup_1year_sf8], 'Sf8'
  add_nested_model [:followup_90day_chart_sf, :followup_1year_chart_sf], 'ChartSf'

  belongs_to :discharge_location, class_name: Domain::ResidenceType
  belongs_to :reason_for_admission, class_name: Domain::ReasonForAdmission

  validates :acute_rehab_admission, presence: true

  def episode_date
    acute_rehab_admission
  end
end
