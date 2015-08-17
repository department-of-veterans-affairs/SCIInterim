class Omr < ActiveRecord::Base
  belongs_to :patient

  def episode_date
    admission_date
  end

  def self.collections
    {
      discharge_location: Domain::ResidenceType.collection,
    }.with_indifferent_access
  end
end
