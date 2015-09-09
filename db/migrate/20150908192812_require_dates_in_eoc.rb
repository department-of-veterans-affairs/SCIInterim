class RequireDatesInEoc < ActiveRecord::Migration
  def change
    # Populate nulls with obivously bogus date.
    change_column_null :omrs, :start_date, false, "1234-01-01"
    change_column_null :acute_rehabs, :acute_rehab_admission, false, "1234-01-01"
    change_column_null :annual_evaluations, :eval_offered, false, "1234-01-01"
  end
end
