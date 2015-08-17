require 'domain_seeds'

class CreateKurtzkeEdsses < ActiveRecord::Migration
  include DomainSeeds::MigrationHelper

  def change
    create_table :domain_kurtzke_edss_scores do |t|
      t.text :name
    end

    create_table :kurtzke_edsses do |t|
      t.string :care_type
      t.string :score_type
      t.integer :scale_value

      t.timestamps
    end

    remove_column :annual_evaluations, :kurtzke_edss, :string
    add_column :annual_evaluations, :kurtzke_edss_id, :integer
    add_foreign_key :annual_evaluations, :kurtzke_edsses, column: :kurtzke_edss_id

    reversible do |dir|
      dir.up do
        enum_to_domain(:kurtzke_edsses, :domain_kurtzke_edss_scores, :scale_value)

        ActiveRecord::Base.transaction do
          annual_evaluations = ActiveRecord::Base.connection.execute(
            "SELECT id FROM annual_evaluations")
          annual_evaluations.values.each do |row|
            raise "Unexpected #{row.inspect}" if row.size != 1
            annual_evaluation_id = row[0]
            insert_result = ActiveRecord::Base.connection.execute(
              "INSERT INTO kurtzke_edsses (created_at, updated_at) VALUES (now(), now()) RETURNING id")
            raise "Unexpected #{insert_result.inspect}" if insert_result.values.size != 1 && insert_result.values.first.size != 1
            kurtzke_edss_id = insert_result.values[0][0]
            add_kurtzke_edss_query = <<-EOM
              UPDATE annual_evaluations
                SET kurtzke_edss_id = '#{kurtzke_edss_id}',
                    updated_at = now()
                WHERE id = '#{annual_evaluation_id}'
            EOM
            ActiveRecord::Base.connection.execute(add_kurtzke_edss_query)
          end
        end
      end
      dir.down do
        # Column and table are deleted by migration so no need to do anything.
      end
    end
  end
end
