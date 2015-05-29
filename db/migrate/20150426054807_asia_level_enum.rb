class AsiaLevelEnum < ActiveRecord::Migration
  def change
    change_column :patients, :asia_level, 'integer USING CAST(asia_level AS integer)'
  end
end
