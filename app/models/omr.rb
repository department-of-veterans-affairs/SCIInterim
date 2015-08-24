class Omr < ActiveRecord::Base
  belongs_to :patient

  belongs_to :start_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :start_sf8
  validates_associated :start_sf8

  belongs_to :finish_sf8, class_name: 'Sf8'
  accepts_nested_attributes_for :finish_sf8
  validates_associated :finish_sf8

  def episode_date
    admission_date
  end

  def self.collections
    {
      discharge_location: Domain::ResidenceType.collection,
    }.with_indifferent_access
  end
end
