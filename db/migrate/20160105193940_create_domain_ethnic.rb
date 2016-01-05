require "domain_seeds"

class CreateDomainEthnic < ActiveRecord::Migration
  def change
    create_table :domain_ethnics do |t|
      t.string :name, null: false

    	t.timestamps
    	t.index :name, unique: true
    end

    add_reference :patients, :ethnic, references: :domain_ethnics
    add_foreign_key :patients, :domain_ethnics, column: :ethnic_id
    
   	DomainSeeds::seed_domain_ethnics
  end
end
