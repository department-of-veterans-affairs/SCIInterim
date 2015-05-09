class OutpatientEpisode < ActiveRecord::Base
  acts_as :episode_of_care
end
