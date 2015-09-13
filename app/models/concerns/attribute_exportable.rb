module AttributeExportable
    extend ActiveSupport::Concern
  included do
    def self.all_attributes
      attribute_hash = attribute_names.inject({}) { |memo, attr| memo[attr] = 1; memo }
      nested_attributes = Set.new(nested_attributes_options.keys)

      # A * B & accepts nested: value: sub_attr hash. attr_name: A[B][attr]
      # A belongs to B & not nested & domain: value: 1. attr_name: association.name
      # A belongs to B & not nested & not domain: value: 1, attr_name: association.fk  == NO CHANGE ==
      # A has_one or has_many B & not nested & not domain: value: sub_attr hash. attr_name: A[B][attr]
      reflect_on_all_associations.each do |association|
        # All assocation types other than belongs_to assocations without
        # accepts_nested_attributes_for should have its foreign key
        # replaced with the association name and mapping to the association's
        # attributes.
        #
        # This prevents an infinite loop walking the association graph.
        if association.macro == :has_one || association.macro == :has_many || nested_attributes.include?(association.name)
          attribute_hash.delete(association.foreign_key)
          attribute_hash[association.name] = association.klass.all_attributes
        elsif association.macro == :belongs_to
          # There is a special use of belongs_to in this code for domain
          # tables. For domain tables, use the association name.
          if association.polymorphic?
            # TODO(awong): This is a hack around asia.
          elsif association.klass.parent == Domain
            attribute_hash.delete(association.foreign_key)
            attribute_hash[association.name] = 1
          end
        end
      end
      attribute_hash
    end
  end
end

