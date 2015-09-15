class Omr < ActiveRecord::Base
  include ModelNestable

  belongs_to :patient

  add_nested_model [:start_asia, :finish_asia], 'Asia'
  add_nested_model [:start_chart_sf, :finish_chart_sf, :followup_90day_chart_sf, :followup_1yr_chart_sf], 'ChartSf'
  add_nested_model [:start_sf8, :finish_sf8, :followup_90day_sf8, :followup_1yr_sf8], 'Sf8'

  belongs_to :discharge_location, class_name: Domain::ResidenceType
  belongs_to :start_hub, class_name: Domain::SciHub

  validates :start_date, presence: true

  def episode_date
    start_date
  end
end
