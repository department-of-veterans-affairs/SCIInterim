class KurtzkeEdss < ActiveRecord::Base
  include AttributeExportable

  belongs_to :scale_value, class_name: Domain::KurtzkeEdssScore
end
