# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'domain_seeds'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Work around some fragilely writen migrations with foreign keys which causes
# guard to barf. Dropping all constraints prior to reseting for a test is good
# enough.
if ActiveRecord::Migrator.needs_migration?
  drop_constraints = ActiveRecord::Base.connection.select_all <<-SQL
 SELECT 'ALTER TABLE '||table_name||' DROP CONSTRAINT  IF EXISTS '||constraint_name||' CASCADE;' as sql
   FROM information_schema.constraint_table_usage;
  SQL

  drop_constraints.each do |drop_constraint|
   ActiveRecord::Base.connection.execute(drop_constraint['sql'])
  end
end

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Takes the data parameter and deterministically creates a different
# value suitable for use in testing an edit of a database model.
def modify_value_for_test(data, options = {})
  if options[:collection].present? and !options[:collection].empty?
    left_over = options[:collection].reject { |item| item == data }
    raise "Not enough options for unique value" if left_over.length == 0
    new_value = left_over[-1]
    # Handle domain tables.
    if new_value.is_a?(ActiveRecord::Base)
      return new_value.id
    else
      return new_value
    end
  else
    case data
    when String, NilClass
      "z#{data}"
    when Date
      data + 1.day
    when TrueClass
      false
    when FalseClass
      true
    when Fixnum
      data + 13
    else
      raise "Unknown Data type #{data.class.name}"
    end
  end
end

# Modifies the attribute_name in model with a new, different, value.
def modify_for_test(model, collection_map, attribute_name)
  new_value = modify_value_for_test(model.send(attribute_name),
                                    collection: collection_map[attribute_name])
  model.send("#{attribute_name}=", new_value)
end

# Capybara helper to check or uncheck a boolean.
def check_or_uncheck(field, value)
    if value
      check(field)
    else
      uncheck(field)
    end
end

def expect_eql_attributes(new_model, orig_model, attribute_name)
  expect(new_model.send(attribute_name)).to eql(orig_model.send(attribute_name)), "For attribute '#{attribute_name}'\n\tExpected: #{orig_model.send(attribute_name)}\n\tGot: #{new_model.send(attribute_name)}"
end

# Takes a model object and fills out a form with all the values in that
# object. Useful for testing create and update operations.
def model_to_form(model_name, field_name, model_object)
  form_name_attribute = "#{model_name}[#{field_name}]"
  new_value = model_object.send(field_name)
  raise "#{field_name} must not be nil. form's can't do that." if new_value.nil?

  begin
    # Find the control type in the webform and execute appropriate
    # capybara form manipulation code.
    tags = all(:xpath, "//*[@name='#{form_name_attribute}']")
    case
    when tags.length == 0
      raise "Attribute #{field_name} not on form" if tags.size == 0
    when tags.length == 1
      # Finding one entry that is a select is a drop-down.
      if tags[0].tag_name == 'select'
        collection_obj_type = model_object.class.collections[field_name].first
        if collection_obj_type.is_a?(ActiveRecord::Base)
          # Reverse map the domain object.
          new_value = collection_obj_type.class.find(new_value).name
        end
        select(new_value, from: form_name_attribute)
      else
        fill_in(form_name_attribute, with: new_value)
      end
    when tags.length > 1
      case new_value
      when TrueClass, FalseClass
        check_or_uncheck(form_name_attribute, new_value)
      else
        # Assume radio button if there is a bag of inputs with the same name
        # and the underlying datatype is not a boolean.
        new_choice = new_value.to_s.downcase.tr(" ", "_").delete("^a-zA-Z0-9_\-")
        choose("#{model_name}_#{field_name}_#{new_choice}")
      end
    end
  rescue
    raise "Error with #{form_name_attribute}: #{$!}\n #{$!.backtrace[1..10].join("\n\t")}"
  end
end

# Filter a model's attribute name list to remove clearly read-only items.
def remove_read_only_attributes(attribute_names)
  attribute_names.reject { |name| ['id', 'created_at', 'updated_at'].include?(name) }
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Set up DatabaseCleaner instead of the default ActiveRecord transactions.
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    load "#{Rails.root}/db/seeds.rb" 
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
    load "#{Rails.root}/db/seeds.rb" 
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.order = 'random'
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, type: :controller
end
