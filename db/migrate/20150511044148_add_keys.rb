class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "episode_of_cares", "patients", name: "episode_of_cares_patient_id_fk"
  end
end
