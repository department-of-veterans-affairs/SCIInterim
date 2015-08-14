require 'domain_seeds'

class CreateChartSfs < ActiveRecord::Migration
  include DomainSeeds::MigrationHelper

  def change
    create_table :domain_chart_sf_at_home_cognitives do |t|
      t.string :name
    end

    create_table :domain_chart_sf_not_home_cognitives do |t|
      t.string :name
    end

    create_table :domain_chart_sf_away_nights do |t|
      t.string :name
    end

    create_table :domain_chart_sf_spouse_resident_options do |t|
      t.string :name
    end

    create_table :domain_chart_sf_initiated_stranger_conversations do |t|
      t.string :name
    end

    create_table :domain_chart_sf_household_incomes do |t|
      t.string :name
    end

    create_table :domain_chart_sf_medical_expenses do |t|
      t.string :name
    end

    create_table :chart_sfs do |t|
      t.integer :q1a_hours_paid
      t.integer :q1b_hours_unpaid
      t.integer :q2_at_home_assisted_cognitive
      t.integer :q3_not_home_assisted_cognitive
      t.integer :q4_hours_out_of_bed_per_day
      t.integer :q5_days_out_of_house_per_week
      t.integer :q6_nights_not_home_per_year
      t.integer :q7a_hours_paid_for_job_per_week
      t.integer :q7b_occupation
      t.integer :q8_hours_in_school_per_week
      t.integer :q9_hours_homemaking_per_week
      t.integer :q10_hours_in_home_maintenance_per_week
      t.integer :q11_hours_in_recreation_per_week
      t.integer :q12_num_people_cohabiting
      t.integer :q13_living_with_spouse
      t.integer :q14_num_relatives_cohabiting
      t.integer :q15_num_associates_visited_per_month
      t.integer :q16_num_friends_visited_per_month
      t.integer :q17_num_initiated_stranger_conversations_per_month
      t.integer :q18_household_combined_income
      t.integer :q19_total_medical_expenses_last_year

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        enum_to_domain(:chart_sfs, :domain_chart_sf_at_home_cognitives, :q2_at_home_assisted_cognitive)
        enum_to_domain(:chart_sfs, :domain_chart_sf_not_home_cognitives, :q3_not_home_assisted_cognitive)
        enum_to_domain(:chart_sfs, :domain_chart_sf_away_nights, :q6_nights_not_home_per_year)
        enum_to_domain(:chart_sfs, :domain_chart_sf_spouse_resident_options, :q13_living_with_spouse)
        enum_to_domain(:chart_sfs, :domain_chart_sf_initiated_stranger_conversations, :q17_num_initiated_stranger_conversations_per_month)
        enum_to_domain(:chart_sfs, :domain_chart_sf_household_incomes, :q18_household_combined_income)
        enum_to_domain(:chart_sfs, :domain_chart_sf_medical_expenses, :q19_total_medical_expenses_last_year)
      end
      dir.down do
        domain_to_enum(:chart_sfs, :q2_at_home_assisted_cognitive)
        domain_to_enum(:chart_sfs, :q3_not_home_assisted_cognitive)
        domain_to_enum(:chart_sfs, :q6_nights_not_home_per_year)
        domain_to_enum(:chart_sfs, :q13_living_with_spouse)
        domain_to_enum(:chart_sfs, :q17_num_initiated_stranger_conversations_per_month)
        domain_to_enum(:chart_sfs, :q18_household_combined_income)
        domain_to_enum(:chart_sfs, :q19_total_medical_expenses_last_year)
      end
    end
  end
end
