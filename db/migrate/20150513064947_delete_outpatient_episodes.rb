class DeleteOutpatientEpisodes < ActiveRecord::Migration
  def change
    drop_table :outpatient_episodes
  end
end
