require 'rails_helper'

RSpec.describe Sf8, type: :model do
  let(:subject) { create(:sf8) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
