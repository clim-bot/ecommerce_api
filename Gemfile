# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# For password hashing
gem 'bcrypt', '~> 3.1.7'
# For JWT authentication
gem 'jwt', '~> 2.2'
# For handling Cross-Origin Resource Sharing (CORS)
gem 'rack-cors', require: 'rack/cors'

gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false

  gem 'rubocop', require: false

  # Use for testing
  gem 'rspec-rails', '~> 7.0'

  # Swagger documentation to help dev easily understand and interact with the api
  gem 'rswag'

  gem 'rswag-api'

  gem 'rswag-ui'

  gem 'rswag-specs'

  gem 'database_cleaner-active_record'

  gem 'factory_bot_rails'

  gem 'shoulda-matchers', '~> 6.4'

  gem 'rubocop-discourse'
end
