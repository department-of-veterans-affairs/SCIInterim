require 'rails_helper'

describe Fim, type: :model do
  let(:subject) { create(:fim) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
