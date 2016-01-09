require 'rails_helper'

describe Asia, type: :model do
  let(:subject) { create(:asia) }

  it "default factory words" do
    expect(subject).to be_valid
  end

  it "Disallows invalid ASIA classification values" do
    subject.impairment_scale_id = -1
    expect{ subject.save! }.to raise_exception(/not present in table "domain_asia_classifications"/)
  end

  it "Allows correct collection values for enums" do
  end

  it "Disallows invalid Levels of injury" do
    old_level = subject.neurological_sensory_level_left
    subject.neurological_sensory_level_left_id = -1
    expect{ subject.save! }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_sensory_level_left = old_level

    old_level = subject.neurological_sensory_level_right
    subject.neurological_sensory_level_right_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_sensory_level_right = old_level

    old_level = subject.neurological_motor_level_left
    subject.neurological_motor_level_left_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_motor_level_left = old_level

    old_level = subject.neurological_motor_level_right
    subject.neurological_motor_level_right_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_motor_level_right = old_level

    old_level = subject.preservation_sensory_level_left
    subject.preservation_sensory_level_left_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_sensory_level_left = old_level

    old_level = subject.preservation_sensory_level_right
    subject.preservation_sensory_level_right_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_sensory_level_right = old_level

    old_level = subject.preservation_motor_level_left
    subject.preservation_motor_level_left_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_motor_level_left = old_level

    old_level = subject.preservation_motor_level_right
    subject.preservation_motor_level_right_id = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_motor_level_right = old_level
  end

  it "Enforces symmetry" do
    # Ensure everything is symmetric.
    subject.neurological_motor_level_left = Domain::LevelOfInjury.first
    subject.neurological_motor_level_right = Domain::LevelOfInjury.first
    subject.neurological_sensory_level_left = Domain::LevelOfInjury.first
    subject.neurological_sensory_level_right = Domain::LevelOfInjury.first
    subject.preservation_motor_level_left = Domain::LevelOfInjury.first
    subject.preservation_motor_level_right = Domain::LevelOfInjury.first
    subject.preservation_sensory_level_left = Domain::LevelOfInjury.first
    subject.preservation_sensory_level_right = Domain::LevelOfInjury.first
    subject.has_motor_or_sensory_asymmetry = false

    # Ensure assymmetric values per pair
    subject.neurological_motor_level_right = Domain::LevelOfInjury.last
    expect{ subject.save! }.to raise_exception(/Neurological motor level right does not match left/)

    subject.neurological_sensory_level_right = Domain::LevelOfInjury.last
    expect{ subject.save! }.to raise_exception(/Neurological sensory level right does not match left/)

    subject.preservation_motor_level_right = Domain::LevelOfInjury.last
    expect{ subject.save! }.to raise_exception(/Preservation motor level right does not match left/)

    subject.preservation_sensory_level_right = Domain::LevelOfInjury.last
    expect{ subject.save! }.to raise_exception(/Preservation sensory level right does not match left/)
  end
end
