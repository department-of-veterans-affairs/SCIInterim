class AddNotesToAnnualEvaluation < ActiveRecord::Migration
  def change
  	add_column :annual_evaluations, :notes, :text
  end
end
