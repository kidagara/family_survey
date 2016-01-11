require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
require "database_cleaner"

Dir[File.expand_path("test/support/**/*.rb")].each { |file| require file }
Dir[File.expand_path("test/factories/**/*.rb")].each { |file| require file }

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end

  def manually_sign_in(identity)
    visit sign_in_path
    fill_in :auth_key, with: identity.email
    fill_in :password, with: identity.password
    click_button "Login"
  end
end
