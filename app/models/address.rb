class Address < ActiveRecord::Base
  has_one :patient
end
