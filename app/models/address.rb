require 'countries'

class Address < ActiveRecord::Base
  def self.collections
    {
      "state" => Country['US'].states.map { |key, value| value["name"] }
    }.with_indifferent_access
  end
end
