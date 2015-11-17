class CreateDomainMsSpecifics < ActiveRecord::Migration
  def change
    create_table :domain_ms_specifics do |t|
      t.string :name
    end
  end
end
