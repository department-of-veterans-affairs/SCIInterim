class AddRegistrationFields < ActiveRecord::Migration
  def change
  add_column :patients, :last_name, :string
  reversible do |dir|
    dir.up do
      Patient.all.each do |patient|
        name = patient.name.split(' ')
        patient.update_attributes!('name' => name[0], 'last_name' => name[1])
      end
    end
    dir.down do
      Patient.all.each do |patient|
        patient.update_attributes!(name: "#{patient.name} #{patient.last_name}")
      end
    end
  end
  rename_column :patients, :name, :first_name
end
end
