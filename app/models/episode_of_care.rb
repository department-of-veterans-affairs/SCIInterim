class EpisodeOfCare < ActiveRecord::Base
  belongs_to :patient 

  validates_presence_of :episode_date
  actable
end
