require 'rails_helper'

describe AnnualEvaluation, type: :model do
  let(:subject) { create(:annual_evaluation) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
