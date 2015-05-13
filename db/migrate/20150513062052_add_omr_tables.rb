class AddOmrTables < ActiveRecord::Migration
  def change
    create_table :omrs do |t|
      t.timestamps

      # START
      t.date :admission_date
      t.integer :start_asia
      t.string :start_fim
      t.string :start_fam
      t.string :start_swls
      t.string :start_chart_sf
      t.string :start_sf_8
      t.string :dusoi

      # GOAL
      t.string :goal_fim
      t.string :goal_fam

      # FINISH
      t.date :omb_completed
      t.integer :finish_asia
      t.string :finish_fim
      t.string :finish_fam
      t.string :finish_swls
      t.string :finish_chart_sf
      t.string :finish_sf_8
      t.string :finish_uspeq
      t.string :discharge_location
    end

    create_table :omr_90s do |t|
      t.timestamps

      # START
      t.date :followup_90_date
      t.integer :fim
      t.string :fam
      t.string :swls
      t.string :chart_sf
      t.string :sf_8
      t.string :place_of_residence
    end

    create_table :omr_1years do |t|
      t.timestamps

      # START
      t.date :followup_90_date
      t.integer :fim
      t.string :fam
      t.string :swls
      t.string :chart_sf
      t.string :sf_8
      t.string :place_of_residence
    end
  end
end
