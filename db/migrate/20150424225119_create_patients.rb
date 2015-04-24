class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :patient_id
      t.string :name
      t.string :ssn
      t.date :dob

      t.timestamps
    end
  end
end
