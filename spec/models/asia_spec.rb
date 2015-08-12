require 'rails_helper'

describe Asia, type: :model do
  let(:subject) { create(:asia) }

  it "default factory words" do
    expect(subject).to be_valid
  end

  it "Disallows invalid ASIA classification values" do
    subject.classification = -1
    expect{ subject.save! }.to raise_exception(/not present in table "domain_asia_classifications"/)
  end

  it "Allows correct collection values for enums" do
  end

  it "Disallows invalid Levels of injury" do
    old_level = subject.neurological_sensory_level_left
    subject.neurological_sensory_level_left = -1
    expect{ subject.save! }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_sensory_level_left = old_level

    old_level = subject.neurological_sensory_level_right
    subject.neurological_sensory_level_right = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_sensory_level_right = old_level

    old_level = subject.neurological_motor_level_left
    subject.neurological_motor_level_left = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_motor_level_left = old_level

    old_level = subject.neurological_motor_level_right
    subject.neurological_motor_level_right = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.neurological_motor_level_right = old_level

    old_level = subject.preservation_sensory_left
    subject.preservation_sensory_left = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_sensory_left = old_level

    old_level = subject.preservation_sensory_right
    subject.preservation_sensory_right = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_sensory_right = old_level

    old_level = subject.preservation_motor_left
    subject.preservation_motor_left = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_motor_left = old_level

    old_level = subject.preservation_motor_right
    subject.preservation_motor_right = -1
expect{  subject.save!  }.to raise_exception(/not present in table "domain_level_of_injuries"/)
    subject.preservation_motor_right = old_level
  end

  it "Enforces symmetry" do
    # Ensure everything is symmetric.
    subject.neurological_motor_level_left = Asia.collections[:neurological_motor_level_left][1].id
    subject.neurological_motor_level_right = Asia.collections[:neurological_motor_level_right][1].id
    subject.neurological_sensory_level_left = Asia.collections[:neurological_sensory_level_left][1].id
    subject.neurological_sensory_level_right = Asia.collections[:neurological_sensory_level_right][1].id
    subject.preservation_motor_left = Asia.collections[:preservation_motor_left][1].id
    subject.preservation_motor_right = Asia.collections[:preservation_motor_right][1].id
    subject.preservation_sensory_left = Asia.collections[:preservation_sensory_left][1].id
    subject.preservation_sensory_right = Asia.collections[:preservation_sensory_right][1].id
    subject.has_motor_or_sensory_asymmetry = false

    # Ensure assymmetric values per pair
    subject.neurological_motor_level_right = Asia.collections[:neurological_motor_level_right][2].id
    expect{ subject.save! }.to raise_exception(/Neurological motor level right does not match left/)

    subject.neurological_sensory_level_right = Asia.collections[:neurological_sensory_level_right][2].id
    expect{ subject.save! }.to raise_exception(/Neurological sensory level right does not match left/)

    subject.preservation_motor_right = Asia.collections[:preservation_motor_right][2].id
    expect{ subject.save! }.to raise_exception(/Preservation motor right does not match left/)

    subject.preservation_sensory_right = Asia.collections[:preservation_sensory_right][2].id
    expect{ subject.save! }.to raise_exception(/Preservation sensory right does not match left/)
  end
end
