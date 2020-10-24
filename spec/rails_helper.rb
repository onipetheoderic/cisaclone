# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "wisper/rspec/matchers"
require "rectify/rspec"
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

Rectify::RSpec::DatabaseReporter.enable

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include AuthSpecHelper, type: :request
  config.include AuthSpecHelper, type: :feature
  config.use_transactional_fixtures = true
  config.backtrace_exclusion_patterns << /gems/
  config.infer_spec_type_from_file_location!
  config.include Rails.application.routes.url_helpers
  config.include EmailHelpers

end
