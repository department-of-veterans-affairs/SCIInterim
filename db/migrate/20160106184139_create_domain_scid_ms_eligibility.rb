class CreateDomainScidMsEligibility < ActiveRecord::Migration
  def change
    create_table :domain_scid_ms_eligibilities do |t|
      t.string :name, null: false

    	t.timestamps
    	t.index :name, unique: true
    end

    add_reference :patients, :scid_ms_eligibility, references: :domain_scid_ms_eligibilities
    add_foreign_key :patients, :domain_scid_ms_eligibilities, column: :scid_ms_eligibility_id
  end
end
