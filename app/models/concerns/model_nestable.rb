module ModelNestable
    extend ActiveSupport::Concern
  included do
    def self.add_nested_model(fields, nested_model_name)
      if !fields.kind_of?(Array)
        fields = [fields]
      end
      fields.each do |field|
        belongs_to field, class_name: nested_model_name
        accepts_nested_attributes_for field
        validates_associated field
      end
    end
  end
end
