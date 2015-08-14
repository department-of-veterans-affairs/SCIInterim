require 'rails_helper'

describe ChartSf, type: :model do
  let(:subject) { create(:chart_sf) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
