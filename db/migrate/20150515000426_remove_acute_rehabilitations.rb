class RemoveAcuteRehabilitations < ActiveRecord::Migration
  def change
    drop_table :acute_rehabilitations
  end
end
