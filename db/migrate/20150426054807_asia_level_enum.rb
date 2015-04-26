class AsiaLevelEnum < ActiveRecord::Migration
  def change
    change_column :patients, :asia_level, :integer
  end
end
