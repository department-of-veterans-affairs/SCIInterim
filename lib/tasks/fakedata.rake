require 'factory_girl'

namespace :app do
  desc "Generate fake data for database."
  task :seed_fake => :environment do
    ActiveRecord::Base.transaction do
      for i in 1..50
        patient = FactoryGirl.create(:patient)

        patient.acute_rehabs << FactoryGirl.create(:acute_rehab)
        patient.annual_evaluations << FactoryGirl.create(:annual_evaluation)
        patient.omrs << FactoryGirl.create(:omr)

        patient.save!
      end
    end
  end
end

