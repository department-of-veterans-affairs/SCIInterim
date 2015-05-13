class DeleteOutpatientEpisodes < ActiveRecord::Migration
  def change
    EpisodeOfCare.where(actable_type: "OutpatientEpisode").delete_all
    drop_table :outpatient_episodes
  end
end
