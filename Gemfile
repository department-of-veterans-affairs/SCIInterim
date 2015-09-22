source 'https://rubygems.org'
ruby "2.1.2"

gem 'active_record-acts_as'
gem 'autoprefixer-rails'  # We want this for handling vender prefix on css.
gem 'bcrypt'
gem 'foundation-rails'
gem 'country_select'
gem 'devise'
gem 'faker'  # TODO(awong): Move to :development,:test after db/seeds.rb gets real data.
gem 'factory_girl_rails'  # TODO(awong): Move to :development,:test after db/seeds.rb gets real data.
gem 'jbuilder'
gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'sass'
gem 'sass-rails'
gem 'simple_form', :git => 'https://github.com/plataformatec/simple_form.git'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'render_csv'
gem 'acts_as_xlsx'
gem 'axlsx_rails'
gem 'goldiloader'

# For Heroku asset compilation.
group :production do
  gem 'rails_serve_static_assets'
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler'
  gem 'pry'
end

group :test, :darwin do
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'byebug'
  gem 'capybara-webkit'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'resque_spec'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'timecop'
  # gem 'brakeman'  # Enable once we figure out how to setup security scanning.
end
