FactoryGirl.define do
  factory :kurtzke_edss do
    care_type { Faker::Lorem.word }
    score_type { Faker::Lorem.word }
    scale_value { KurtzkeEdss.collections[:scale_value].sample.id }
  end
end
