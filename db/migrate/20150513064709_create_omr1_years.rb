class CreateOmr1Years < ActiveRecord::Migration
  def change
    create_table :omr1_years do |t|
      t.timestamps

      t.date :followup_date
      t.integer :fim
      t.string :fam
      t.string :swls
      t.string :chart_sf
      t.string :sf_8
      t.string :place_of_residence
    end
  end
end
