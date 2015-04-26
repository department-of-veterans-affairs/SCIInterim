class FixDateFirstSeenName < ActiveRecord::Migration
  def change
    rename_column :patients, :data_first_seen_in_va_sci, :date_first_seen_in_va_sci
    change_column :patients, :date_first_seen_in_va_sci, :date
  end
end
