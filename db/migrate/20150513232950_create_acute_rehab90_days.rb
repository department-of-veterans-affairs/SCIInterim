class CreateAcuteRehab90Days < ActiveRecord::Migration
  def change
    create_table :acute_rehab90_days do |t|
      t.timestamps

      t.date :followup_date
      t.integer :fim
      t.string :swls
      t.string :chart_sf
      t.string :sf_8
      t.string :place_of_residence
    end
  end
end
