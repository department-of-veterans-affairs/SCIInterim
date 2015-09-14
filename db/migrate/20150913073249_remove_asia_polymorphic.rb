class RemoveAsiaPolymorphic < ActiveRecord::Migration
  def change
    add_reference :asia, :patient, index: true
    add_foreign_key :asia, :patients

    remove_reference(:asia, :has_asia, polymorphic: true)

    rename_table :asia, :asias

    # Fix Acute Rehab
    add_reference :acute_rehabs, :start_asia, references: :asias, index: true
    add_foreign_key :acute_rehabs, :asias, column: :start_asia_id

    add_reference :acute_rehabs, :finish_asia, references: :asias, index: true
    add_foreign_key :acute_rehabs, :asias, column: :finish_asia_id

    # Fix Annaul Eval
    add_reference :annual_evaluations, :asia, index: true
    add_foreign_key :annual_evaluations, :asias, column: :asia_id

    # Fix Patient
    add_reference :patients, :asia, index: true
    add_foreign_key :patients, :asias, column: :asia_id
  end
end
