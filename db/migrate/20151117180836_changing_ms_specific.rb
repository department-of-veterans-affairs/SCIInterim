class ChangingMsSpecific < ActiveRecord::Migration
  def change
    change_table :ms_specifics do |t|
      t.string :name
    end
  end
end
