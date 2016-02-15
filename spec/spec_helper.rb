require_relative 'support/controller_helpers'
require 'devise'
require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.include ControllerHelpers, type: :controller

  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
