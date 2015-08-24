class UseChartSf < ActiveRecord::Migration
  def change
    remove_column :acute_rehabs, :followup_1yr_chart_sf, :string
    remove_column :acute_rehabs, :followup_90day_chart_sf, :string
    add_reference :acute_rehabs, :followup_1year_chart_sf, references: :chart_sfs
    add_reference :acute_rehabs, :followup_90day_chart_sf, references: :chart_sfs

    remove_column :omrs, :start_chart_sf, :string
    remove_column :omrs, :finish_chart_sf, :string
    add_reference :omrs, :start_chart_sf, references: :chart_sfs
    add_reference :omrs, :finish_chart_sf, references: :chart_sfs
  end
end
