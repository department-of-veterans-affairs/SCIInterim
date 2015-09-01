require 'rails_helper'

describe FimMeasurement, type: :model do
  let(:subject) { create(:fim_measurement) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
