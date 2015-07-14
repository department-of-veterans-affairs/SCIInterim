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

  it "correctly calculates age even with leap years" do
    random_dob = Time.utc(1955, 10, 21, 16, 29, 0)
    random_now = Time.utc(2015, 10, 21, 16, 29, 0)
    leap_dob = Time.utc(1956, 2, 29, 12, 0, 0)
    leap_now = Time.utc(2012, 2, 29, 12, 0, 0)

    Timecop.freeze(random_now) do
      expect(build(:patient, dob: random_dob).computed_age).to eql 60
    end

    Timecop.freeze(random_now) do
      expect(build(:patient, dob: leap_dob).computed_age).to eql 59
    end

    Timecop.freeze(leap_now) do
      expect(build(:patient, dob: random_dob).computed_age).to eql 56
    end

    Timecop.freeze(leap_now) do
      expect(build(:patient, dob: leap_dob).computed_age).to eql 56
    end

    # Test boundary case on date calculation.
    Timecop.freeze(leap_now - 1.day) do
      expect(build(:patient, dob: leap_dob).computed_age).to eql 55
    end
  end
end
