require 'rails_helper'

describe AcuteRehab, type: :model do
  let(:subject) { create(:acute_rehab) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
