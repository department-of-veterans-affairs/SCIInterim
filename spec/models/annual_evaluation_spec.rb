require 'rails_helper'

describe AnnualEvaluation, type: :model do
  let(:subject) { create(:annual_evaluation) }

  it "default factory works" do
    expect(subject).to be_valid
  end

  it "correctly calculates bmi" do
    # Golden values basd on the formula:
    #   weight * 703 / (height^w)
    # Tests rounding up and rounding down.
    subject.weight_lbs = 160
    subject.height_inches = 73
    expect(subject.bmi).to eql 21.11

    subject.weight_lbs = 158
    expect(subject.bmi).to eql 20.84
  end
end
