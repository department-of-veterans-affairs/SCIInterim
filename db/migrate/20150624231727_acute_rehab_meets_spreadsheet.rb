class AcuteRehabMeetsSpreadsheet < ActiveRecord::Migration
  def change
    create_table "transfers" do |t|
      t.belongs_to :acute_rehabs, index: true

      t.date :in
      t.date :out

      t.timestamps null: false
    end

    add_column :acute_rehabs, :reason_for_admission, :integer
    add_column :acute_rehabs, :reason_for_admission_other, :string
    add_column :acute_rehabs, :hospital_admission, :date
    add_column :acute_rehabs, :acute_rehab_admission, :date
    add_column :acute_rehabs, :hospital_discharge, :date
    add_column :acute_rehabs, :acute_rehab_discharge, :date

    add_column :acute_rehabs, :residence_type, :integer
    add_column :acute_rehabs, :residence_name, :string
    add_column :acute_rehabs, :discharge_to_community, :boolean

    add_column :acute_rehabs, :start_sf8, :string

    add_column :acute_rehabs, :finish_swls, :string
    add_column :acute_rehabs, :finish_sf8, :string

    add_column :acute_rehabs, :followup_90day_date, :date
    add_column :acute_rehabs, :followup_90day_fim, :string
    add_column :acute_rehabs, :followup_90day_swls, :string
    add_column :acute_rehabs, :followup_90day_chart_sf, :string
    add_column :acute_rehabs, :followup_90day_sf8, :string

    add_column :acute_rehabs, :followup_1yr_date, :date
    add_column :acute_rehabs, :followup_1yr_fim, :string
    add_column :acute_rehabs, :followup_1yr_swls, :string
    add_column :acute_rehabs, :followup_1yr_chart_sf, :string
    add_column :acute_rehabs, :followup_1yr_sf8, :string

    remove_column :acute_rehabs, :finish_kurtzke_edss, :string
    remove_column :acute_rehabs, :finish_uspeq, :string
    remove_column :acute_rehabs, :admission_date, :string
    remove_column :acute_rehabs, :start_kurtzke_edss, :string
    remove_column :acute_rehabs, :accute_rehab_completed, :date
    remove_column :acute_rehabs, :discharge_location, :string
  end
end
