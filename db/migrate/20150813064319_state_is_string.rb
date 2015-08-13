class StateIsString < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        remove_column :addresses, :state
        add_column :addresses, :state, :string
      end
      dir.down do
        remove_column :addresses, :state
        add_column :addresses, :state, :integer
      end
    end
  end
end
