class CreateEpisodeOfCares < ActiveRecord::Migration
  def change
    create_table :episode_of_cares do |t|
      t.date :care_date
      t.timestamps
    end
  end
end
