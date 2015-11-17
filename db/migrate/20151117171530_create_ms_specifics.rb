class CreateMsSpecifics < ActiveRecord::Migration
  def change
    create_table :ms_specifics do |t|

      t.timestamps null: false
    end
  end
end
