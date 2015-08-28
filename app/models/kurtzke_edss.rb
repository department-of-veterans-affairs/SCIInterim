class KurtzkeEdss < ActiveRecord::Base
  belongs_to :scale_value, class_name: Domain::KurtzkeEdssScore
  def self.collections
    {
      "scale_value" => Domain::KurtzkeEdssScore.collection,
    }.with_indifferent_access
  end
end
