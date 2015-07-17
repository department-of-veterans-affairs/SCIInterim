module AttributeParam
  extend ActiveSupport::Concern

  # Takes a model and geneates a list of attribute names suitable for use with
  # StrongParams.
  #
  # In particular, removes the timestamp columns.
  def nested_model_attributes(model)
    model.attribute_names.reject { |name| ['created_at', 'updated_at'].include?(name) }
  end
end
