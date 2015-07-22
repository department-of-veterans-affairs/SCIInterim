class RemoveAsiaFromAcuteRehab < ActiveRecord::Migration
  def change
    remove_column :acute_rehabs, :start_asia, :integer
    remove_column :acute_rehabs, :finish_asia, :integer
  end
end
