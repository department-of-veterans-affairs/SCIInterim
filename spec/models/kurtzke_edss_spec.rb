require 'rails_helper'

describe KurtzkeEdss, type: :model do
  let(:subject) { create(:kurtzke_edss) }

  it "default factory works" do
    expect(subject).to be_valid
  end
end
