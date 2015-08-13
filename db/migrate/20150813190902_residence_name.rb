class ResidenceName < ActiveRecord::Migration
  def change
    remove_column :acute_rehabs, :residence_name, :string
  end
end
