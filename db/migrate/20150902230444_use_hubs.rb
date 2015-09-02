class UseHubs < ActiveRecord::Migration
  def change
    remove_column :patients, :assigned_sci_hub, :integer
    add_reference :patients, :assigned_sci_hub, references: :domain_sci_hubs
    add_foreign_key :patients, :domain_sci_hubs, column: :assigned_sci_hub_id

    remove_column :patients, :preferred_sci_hub, :integer
    add_reference :patients, :preferred_sci_hub, references: :domain_sci_hubs
    add_foreign_key :patients, :domain_sci_hubs, column: :preferred_sci_hub_id
  end
end
