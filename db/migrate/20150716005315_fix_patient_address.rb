class FixPatientAddress < ActiveRecord::Migration
  def change

    # rename address to address_id to not confuse rails.
    remove_foreign_key :patients, column: :address, dependent: :delete
    remove_column :patients, :address, :integer
    add_column :patients, :address_id, :integer, null: false
    add_foreign_key :patients, :addresses, column: :address_id, dependent: :delete
    add_index :patients, :address_id, unique: true

    # rename caregiver_address to caregiver_address_id to not confuse rails.
    remove_foreign_key :patients, column: :caregiver_address, dependent: :delete
    remove_column :patients, :caregiver_address, :integer
    add_column :patients, :caregiver_address_id, :integer, null: false
    add_foreign_key :patients, :addresses, column: :caregiver_address_id, dependent: :delete
    add_index :patients, :caregiver_address_id, unique: true
  end
end
