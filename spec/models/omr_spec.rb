require 'rails_helper'

describe Omr, type: :model do
  let(:subject) { create(:omr) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
