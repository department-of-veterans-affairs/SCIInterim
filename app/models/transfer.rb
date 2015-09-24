class Transfer < ActiveRecord::Base
  include AttributeExportable

  belongs_to :AcuteRehab
end
