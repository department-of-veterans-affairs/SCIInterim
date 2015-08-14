class Omr < ActiveRecord::Base
  acts_as :episode_of_care

  def self.collections
    {
      discharge_location: Domain::ResidenceType.collection,
    }.with_indifferent_access
  end
end
