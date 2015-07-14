class DeleteEocFollowups < ActiveRecord::Migration
  def change
    drop_table :acute_rehab90_days
    drop_table :acute_rehab1_years
    drop_table :omr90_days
    drop_table :omr1_years
  end
end
