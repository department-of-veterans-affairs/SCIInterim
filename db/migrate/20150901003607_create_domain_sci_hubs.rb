require 'domain_seeds'

class CreateDomainSciHubs < ActiveRecord::Migration
  def change
    create_table :domain_sci_hubs do |t|
      t.string :name
      t.string :station
      t.integer :visn
      t.text :city
    end
    add_index :domain_sci_hubs, :station, unique: true

    add_column :domain_va_medical_centers, :station, :string
    add_index :domain_va_medical_centers, :station, unique: true
    add_column :domain_va_medical_centers, :visn, :integer

    DomainSeeds::seed_domain_sci_hubs
    DomainSeeds::seed_domain_va_medical_centers
  end
end
