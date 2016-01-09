class AddImpairmentScaleToAsia < ActiveRecord::Migration
  def change
  	remove_foreign_key :asias, column: :classification
  	remove_column :asias, :classification

    add_reference :asias, :impairment_scale, references: :domain_asia_classifications
    add_foreign_key :asias, :domain_asia_classifications, column: :impairment_scale_id
  end
end
