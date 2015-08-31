class KurtzkeEdss < ActiveRecord::Base
  belongs_to :scale_value, class_name: Domain::KurtzkeEdssScore
end
