# frozen_string_literal: true

require_relative 'config/application'

# Load Rails environment and standard tasks
Rails.application.load_tasks

# Ensure RSpec tasks are available
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  puts 'RSpec is not available. Please add it to your Gemfile.'
end

# Define the default task to run the specs
task default: :spec

# Example of custom tasks (optional)
namespace :db do
  desc 'Drop, create, migrate, and seed the database'
  task reset: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end

namespace :test do
  desc 'Run all tests (RSpec)'
  task all: :spec
end
