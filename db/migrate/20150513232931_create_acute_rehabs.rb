class CreateAcuteRehabs < ActiveRecord::Migration
  def change
    create_table :acute_rehabs do |t|
      t.timestamps

      # START
      t.date :admission_date
      t.integer :start_asia
      t.string :start_fim
      t.string :start_swls
      t.string :start_kurtzke_edss

      # GOAL
      t.string :goal_fim

      # FINISH
      t.date :accute_rehab_completed
      t.integer :finish_asia
      t.string :finish_fim
      t.string :finish_kurtzke_edss
      t.string :finish_uspeq
      t.string :discharge_location
    end
  end
end
