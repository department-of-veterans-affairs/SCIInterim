require 'spec_helper.rb'

describe Patient do
  it "has valid factory" do
    expect(create(:patient)).to be_valid
  end

  it "validates firstname cannot have special chars or spaces" do
    expect(build(:patient, first_name: 'albert')).to be_valid
    expect(build(:patient, first_name: 'albert1')).to be_invalid
    expect(build(:patient, first_name: 'albert#')).to be_invalid
    expect(build(:patient, first_name: 'albert_')).to be_invalid
    expect(build(:patient, first_name: 'albert+')).to be_invalid
    expect(build(:patient, first_name: 'albert +')).to be_invalid
  end

  it "validates lastname cannot have special chars or spaces" do
    expect(build(:patient, last_name: 'albert')).to be_valid
    expect(build(:patient, last_name: 'albert1')).to be_invalid
    expect(build(:patient, last_name: 'albert#')).to be_invalid
    expect(build(:patient, last_name: 'albert_')).to be_invalid
    expect(build(:patient, last_name: 'albert+')).to be_invalid
    expect(build(:patient, last_name: 'albert +')).to be_invalid
  end

  it "validates scido_id is numeric and greater than 0" do
    expect(build(:patient, scido_id: 10)).to be_valid
    expect(build(:patient, scido_id: -10)).to be_invalid
    expect(build(:patient, scido_id: 'A')).to be_invalid
  end

  it "validates ssn follows nnn-nn-nnnn format" do
    expect(build(:patient, ssn: "111-22-3334")).to be_valid
    expect(build(:patient, ssn: "111-22-333")).to be_invalid
    expect(build(:patient, ssn: "11122-333")).to be_invalid
    expect(build(:patient, ssn: 1)).to be_invalid
  end
end
