class KurtzkeEdss < ActiveRecord::Base
  def self.collections
    {
      "scale_value" => Domain::KurtzkeEdssScore.collection,
    }.with_indifferent_access
  end
end
