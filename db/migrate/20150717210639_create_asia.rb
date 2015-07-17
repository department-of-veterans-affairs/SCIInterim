class CreateAsia < ActiveRecord::Migration
  def change
    create_table :asia do |t|
      t.integer :classification
      t.boolean :is_complete
      t.boolean :has_motor_or_sensory_asymmetry
      t.integer :neurological_sensory_level_left
      t.integer :neurological_sensory_level_right
      t.integer :neurological_motor_level_left
      t.integer :neurological_motor_level_right
      t.integer :preservation_sensory_left
      t.integer :preservation_sensory_right
      t.integer :preservation_motor_left
      t.integer :preservation_motor_right

      t.timestamps
    end
  end
end
