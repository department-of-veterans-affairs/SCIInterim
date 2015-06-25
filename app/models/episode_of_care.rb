class EpisodeOfCare < ActiveRecord::Base
  belongs_to :patient 

  actable
end
