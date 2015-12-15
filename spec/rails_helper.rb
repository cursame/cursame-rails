ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'spec_helper'
require 'rspec/rails'
require "codeclimate-test-reporter"
require 'capybara/rails'
require 'capybara/rspec'
require 'support/features_helper_methods'
require 'sidekiq/testing'

require 'helpers/catalog_helpers'

CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Features::HelperMethods, type: :feature
  config.infer_spec_type_from_file_location!

  config.include CatalogHelpers, type: :catalog_model
  config.extend CatalogHelpers, type: :catalog_model

  config.include CatalogHelpers, type: :feature




  Sidekiq::Testing.fake!
  Capybara.default_host = 'http://testing.lvh.me:3001'
  Capybara.app_host = 'http://testing.lvh.me'
  Capybara.always_include_port = true

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    load "#{Rails.root}/db/seeds.rb"
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
    load "#{Rails.root}/db/seeds.rb" if Role.count == 0
    if @request
      @request.host = 'testing.lvh.me'
    end
    Sidekiq::Extensions::DelayedMailer.jobs.clear
  end

  config.after(:each) do
    DatabaseCleaner.clean
    Sidekiq::Extensions::DelayedMailer.jobs.clear
  end
end
