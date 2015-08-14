require 'domain_seeds'

class UpdateResidenceTypes < ActiveRecord::Migration
  def change
    DomainSeeds.seed_domain_residence_types
  end
end
