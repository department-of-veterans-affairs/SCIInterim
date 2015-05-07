class CreateEpisodeOfCares < ActiveRecord::Migration
  def change
    create_table :episode_of_cares do |t|
      t.date :care_date
      t.timestamps
    end

    create_table :annual_evaluations do |t|
      t.actable
      t.timestamps
    end

    create_table :outpatient_episodes do |t|
      t.actable
      t.timestamps
    end

    create_table :accute_rehabilitations do |t|
      t.actable
      t.timestamps
    end
  end
end
