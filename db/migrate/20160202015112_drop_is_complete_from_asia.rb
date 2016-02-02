class DropIsCompleteFromAsia < ActiveRecord::Migration
  def change
  	remove_column :asias, :is_complete
  end
end
