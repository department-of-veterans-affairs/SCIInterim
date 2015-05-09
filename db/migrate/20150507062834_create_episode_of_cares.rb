class CreateEpisodeOfCares < ActiveRecord::Migration
  def change
    create_table :episode_of_cares do |t|
      t.date :episode_date
      t.timestamps
    end

    create_table :annual_evaluations do |t|
      t.actable
      t.integer :asia_level
      t.timestamps
    end

    create_table :outpatient_episodes do |t|
      t.actable
      t.integer :fake_happiness
      t.timestamps
    end

    create_table :acute_rehabilitations do |t|
      t.actable
      t.integer :fake_sadness
      t.timestamps
    end
  end
end
