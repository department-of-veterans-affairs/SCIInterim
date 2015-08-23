class FixTransfersFk < ActiveRecord::Migration
  def change
    remove_column :transfers, :acute_rehabs_id, :integer
    add_column :transfers, :acute_rehab_id, :integer
    add_foreign_key :transfers, :acute_rehabs, column: :acute_rehab_id
    add_index :transfers, :acute_rehab_id

    add_column :transfers, :location, :string
  end
end
