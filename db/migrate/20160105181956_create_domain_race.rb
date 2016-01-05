require "domain_seeds"

class CreateDomainRace < ActiveRecord::Migration
  def change
    create_table :domain_races do |t|
    	t.string :name, null: false

    	t.timestamps
    	t.index :name, unique: true
    end

    add_reference :patients, :race, references: :domain_races
    add_foreign_key :patients, :domain_races, column: :race_id
   	DomainSeeds::seed_domain_races
  end
end
