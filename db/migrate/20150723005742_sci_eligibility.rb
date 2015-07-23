class SciEligibility < ActiveRecord::Migration
  def change
    add_column :patients, :scid_eligibility, :integer
    add_column :patients, :scid_eligibility_other, :string
    add_column :patients, :scid_etiology, :integer
  end
end
