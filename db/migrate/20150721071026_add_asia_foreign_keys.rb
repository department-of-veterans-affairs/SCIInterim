class AddAsiaForeignKeys < ActiveRecord::Migration
  def change
    # Add columns for polymorphic association since many models use asia.
    add_column :asia, :has_asia_id, :integer
    add_column :asia, :has_asia_type, :string
    add_index :asia, :has_asia_id
  end
end
