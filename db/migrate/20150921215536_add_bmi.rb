class AddBmi < ActiveRecord::Migration
  def change
    add_column :annual_evaluations, :height_inches, :integer
    add_column :annual_evaluations, :weight_lbs, :integer
    remove_column :annual_evaluations, :bmi, :integer
  end
end
