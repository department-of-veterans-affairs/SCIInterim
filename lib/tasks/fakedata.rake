require 'factory_girl'

namespace :app do
  desc "Generate fake data for database."
  task :seed_fake => :environment do
    ActiveRecord::Base.transaction do
      for i in 1..50
        patient = FactoryGirl.create(:patient)

        acute_rehab = FactoryGirl.create(:acute_rehab)
        patient.episode_of_cares << acute_rehab

        annual_eval = FactoryGirl.create(:annual_evaluation)
        patient.episode_of_cares << annual_eval

        omr = FactoryGirl.create(:omr)
        patient.episode_of_cares << omr

        patient.save!
      end
    end
  end
end

