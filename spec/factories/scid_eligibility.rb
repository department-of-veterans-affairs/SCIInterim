FactoryGirl.define do
  factory :scid_eligibility, class: Domain::ScidEligibility do
  	name Faker::Lorem.word
  end
end