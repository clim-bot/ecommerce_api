# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'database_cleaner-active_record'
require 'factory_bot_rails'
require 'shoulda/matchers'
require 'rswag/specs'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb`
# are run as spec files by default. This means that files in spec/support
# that end in _spec.rb will both be required and run as specs, causing the specs to be run twice.
#
# You can disable this behaviour by removing the line below, and then you'll need to explicitly
# require the files in spec/support/* manually.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Ensure ActiveRecord is using transactional tests
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_run_excluding integration: true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # FactoryBot setup
  config.include FactoryBot::Syntax::Methods

  # DatabaseCleaner setup
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
end

# Configure Shoulda Matchers to use RSpec as the test framework and full matcher libraries for Rails
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
