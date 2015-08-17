class RemoveEpisodeOfCare < ActiveRecord::Migration
  def change
    add_column :acute_rehabs, :patient_id, :integer
    add_index :acute_rehabs, :patient_id
    add_foreign_key :acute_rehabs, :patients, dependent: :delete

    add_column :annual_evaluations, :patient_id, :integer
    add_index :annual_evaluations, :patient_id
    add_foreign_key :annual_evaluations, :patients, dependent: :delete

    add_column :omrs, :patient_id, :integer
    add_index :omrs, :patient_id
    add_foreign_key :omrs, :patients, dependent: :delete

    reversible do |dir|
      dir.up do
        ActiveRecord::Base.transaction do
          def update_query(table)
            <<-EOM
            UPDATE #{table}
              SET patient_id = episode_of_care.patient_id,
                  updated_at = now()
              FROM (SELECT patient_id, actable_id
                    FROM episode_of_cares
                    WHERE actable_type = '#{table}') AS episode_of_care
              WHERE #{table}.id = episode_of_care.actable_id
            EOM
          end
          ActiveRecord::Base.connection.execute(update_query('acute_rehabs'))
          ActiveRecord::Base.connection.execute(update_query('annual_evaluations'))
          ActiveRecord::Base.connection.execute(update_query('omrs'))
        end
        drop_table :episode_of_cares
      end
      dir.down do
        create_table :episode_of_cares do |t|
          t.integer  :patient_id
          t.integer  :actable_id
          t.string   :actable_type
          t.timestamps
        end

        add_index :episode_of_cares, :patient_id

        ActiveRecord::Base.transaction do
          def insert_query(table)
            <<-EOM
              INSERT INTO episode_of_cares
                (patient_id, actable_id, actable_type, created_at, updated_at)
              SELECT patient_id, id, '#{table}', now(), now()
                 FROM #{table}
            EOM
          end
          ActiveRecord::Base.connection.execute(insert_query('acute_rehabs'))
          ActiveRecord::Base.connection.execute(insert_query('annual_evaluations'))
          ActiveRecord::Base.connection.execute(insert_query('omrs'))
        end
      end
    end
  end
end
