class AddAeRecievedToAnnualEvaluation < ActiveRecord::Migration
  def change
    add_column :annual_evaluations, :ae_received, :boolean, default: false
  end
end
