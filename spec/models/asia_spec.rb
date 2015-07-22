require 'rails_helper'

describe Asia, type: :model do
  let(:subject) { create(:asia) }

  it "default factory words" do
    expect(subject).to be_valid
  end

  it "Disallows invalid ASIA classification values" do
    expect{ subject.classification = -1 }.to raise_exception(/not a valid classification/)
  end

  it "Allows correct collection values for enums" do
  end

  it "Disallows invalid Levels of injury" do
    expect{ subject.neurological_sensory_level_left = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.neurological_sensory_level_right = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.neurological_motor_level_left = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.neurological_motor_level_right = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.preservation_sensory_left = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.preservation_sensory_right = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.preservation_motor_left = -1 }.to raise_exception(/Invalid Level of Injury/)
    expect{ subject.preservation_motor_right = -1 }.to raise_exception(/Invalid Level of Injury/)
  end

  it "Enforces symmetry" do
    # Ensure everything is symmetric.
    subject.neurological_motor_level_left = Asia.level_of_injuries.keys[1]
    subject.neurological_motor_level_right = Asia.level_of_injuries.keys[1]
    subject.neurological_sensory_level_left = Asia.level_of_injuries.keys[1]
    subject.neurological_sensory_level_right = Asia.level_of_injuries.keys[1]
    subject.preservation_motor_left = Asia.level_of_injuries.keys[1]
    subject.preservation_motor_right = Asia.level_of_injuries.keys[1]
    subject.preservation_sensory_left = Asia.level_of_injuries.keys[1]
    subject.preservation_sensory_right = Asia.level_of_injuries.keys[1]
    subject.has_motor_or_sensory_asymmetry = false

    # Ensure assymmetric values per pair
    subject.neurological_motor_level_right = Asia.level_of_injuries.keys[2]
    expect{ subject.save! }.to raise_exception(/Neurological motor level right does not match left/)

    subject.neurological_sensory_level_right = Asia.level_of_injuries.keys[2]
    expect{ subject.save! }.to raise_exception(/Neurological sensory level right does not match left/)

    subject.preservation_motor_right = Asia.level_of_injuries.keys[2]
    expect{ subject.save! }.to raise_exception(/Preservation motor right does not match left/)

    subject.preservation_sensory_right = Asia.level_of_injuries.keys[2]
    expect{ subject.save! }.to raise_exception(/Preservation sensory right does not match left/)
  end
end
