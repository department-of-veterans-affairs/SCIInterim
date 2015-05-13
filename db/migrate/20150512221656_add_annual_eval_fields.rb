class AddAnnualEvalFields < ActiveRecord::Migration
  def change
    add_column :annual_evaluations, :eval_offered, :date
    add_column :annual_evaluations, :eval_completed, :date
    add_column :annual_evaluations, :next_eval, :date
    add_column :annual_evaluations, :is_inpatient, :boolean

    add_column :annual_evaluations, :audit, :string
    add_column :annual_evaluations, :bmi, :string
    add_column :annual_evaluations, :cage, :string
    add_column :annual_evaluations, :ces_d, :string
    add_column :annual_evaluations, :chart_sf, :string
    add_column :annual_evaluations, :cyh, :string
    add_column :annual_evaluations, :dast, :string
    add_column :annual_evaluations, :dusoi, :string
    add_column :annual_evaluations, :dusoi_a, :string
    add_column :annual_evaluations, :fam, :string
    add_column :annual_evaluations, :fim, :string
    add_column :annual_evaluations, :kurtzke_edss, :string
    add_column :annual_evaluations, :kurtzke_fss, :string
    add_column :annual_evaluations, :mnfm, :string
    add_column :annual_evaluations, :prime_md, :string
    add_column :annual_evaluations, :push, :string
    add_column :annual_evaluations, :sf_mpq, :string
    add_column :annual_evaluations, :sf_8, :string
    add_column :annual_evaluations, :swls, :string
    add_column :annual_evaluations, :pumt_kit, :string

    add_column :annual_evaluations, :bladder_drainage_method, :string
    add_column :annual_evaluations, :colonoscopy_received, :date
    add_column :annual_evaluations, :sigmoidoscopy_received, :date
    add_column :annual_evaluations, :diabetic_retinal_screening_received, :date
  end
end
