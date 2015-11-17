class ChangingMsSpecificRemoveFields < ActiveRecord::Migration
  def change
   change_table :ms_specifics do |t| 
     t.remove :created_at, :updated_at
   end 
  end
end
