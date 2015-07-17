source 'https://rubygems.org'
ruby "2.1.2"

gem 'active_record-acts_as'
gem 'autoprefixer-rails'  # We want this for handling vender prefix on css.
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'bootstrap-datepicker-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'country_select'
gem 'devise'
gem 'faker'  # TODO(awong): Move to :development,:test after db/seeds.rb gets real data.
gem 'foreigner'
gem 'immigrant'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'rails', '4.1.7'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

# For Heroku asset compilation.
group :production do
  gem 'rails_serve_static_assets'
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'guard-bundler'
end

group :test, :darwin do
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'coveralls', require: false
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  # gem 'brakeman'  # Enable once we figure out how to setup security scanning.
end

group :development, :test do
  gem 'capybara-webkit'
  gem 'resque_spec'
  gem 'timecop'
end
