Cursame30Lb::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.assets.debug = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  # config.consider_all_requests_local       = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  #config.action_mailer.perform_deliveries = false
  #config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  #config.time_zone = "Mexico_City"
  HOST = 'lvh.me:3000'
  config.action_mailer.default_url_options = { :host => 'cursame.com' }
  config.action_mailer.delivery_method = :sendmail
  #roles
  config.gem "declarative_authorization", :source => "http://gemcutter.org"

  ### mailer ###
  # ActionMailer::Base.smtp_settings = {
  #    :address        => '50.116.21.144',
  #    :port           => '25',
  #    :authentication => 'plain',
  #    :user_name      => 'wichobabas',
  #    :password       => 'qor43e95',
  #    :domain         => 'mail.cursame.me'
  #  }
  #  ActionMailer::Base.delivery_method = :smtp
  config.action_mailer.delivery_method = :ses

end
