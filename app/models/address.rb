require 'countries'

class Address < ActiveRecord::Base
  include AttributeExportable
end
