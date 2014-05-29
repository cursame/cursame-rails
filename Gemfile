source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'#, :groups => [:production]
gem 'sqlite3'
#gema para el manejo de las sesiones
gem 'devise'
gem 'json'

#gema para calendario y tablas espcificas
gem "watu_table_builder", :require => "table_builder"

#gemas para uso de gestion de archivos
gem 'carrierwave', :require => ["carrierwave", "carrierwave/processing/mime_types"]
gem 'mime-types'
gem 'mini_magick'
# Gems used only for assets and not required
# in production environments by default.
# gems for authenticate location and manager from users
 gem "geocoder"
 gem 'useragent'
 
#gemas para conección con otros servicios
 gem 'omniauth'
 gem 'google-api-client', :require => 'google/api_client'
 gem 'omniauth-google-oauth2'
#facebookconnect
gem 'omniauth-facebook'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bourbon', "~> 3.1.8"
  gem 'handlebars_assets'
  gem 'coffee-script'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
 
end
####### gems for debug erros
group :development do
  gem 'binding_of_caller'
  gem 'meta_request'
  
  gem "selenium-webdriver", "~> 2.35.0"
end

gem 'jquery-rails'

#Gem for the comments		
gem 'acts_as_commentable'
#Gem para likes
gem 'acts_as_votable', '~> 0.5.0'

#para los links inteligentes en los comentarios
gem "auto_html"

#paginacion
gem 'will_paginate', "3.0.3"

#gems for preoces time in background
gem 'whenever', :require => false
gem 'state_machine'

# para notifications push
gem 'thin'
#gem 'hooves', require: 'hooves/default'
gem 'private_pub', :git =>'git://github.com/ryanb/private_pub.git'
#gem 'unicorn'

#roles
gem 'declarative_authorization'
gem 'jquery-fileupload-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

#nifty scaffolding
gem "nifty-generators", :group => :development

#group :production, :subtest do
  #gem 'le' 
  
#end
# To use Jbuilder templates for JSON
gem 'jbuilder'
#gem 'httparty'
# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Render pdf from html
gem "pdfkit"
gem "launchy", '~>2.1.2'#, "~> 2.3.0"
# Gem to create non-persistance objects 
gem "active_attr"

gem "mocha", :group => :test

#gemas para contenido
gem "dropbox-sdk", "~> 1.5.1"
gem "youtube_it"
gem "mediawiki-gateway"
gem 'omniauth-dropbox'
gem "dropbox-api"

# Delayed jod
gem 'delayed_job_active_record'
gem "daemons"

# Amazon SES
gem "aws-ses", "~> 0.5.0", :require => 'aws/ses'

# Exception Notifier Plugin for Rails
gem 'exception_notification', '~> 3.0.1'

#active_admin
 gem 'activeadmin'
 gem "meta_search",    '>= 1.1.0.pre'

 # group :development, :test do
 #  gem 'rails-dev-tweaks', '~> 0.6.1' 
 # end
 
gem "wuparty", "~> 1.2.6"
gem 'meta-tags'
gem 'sidekiq'
gem 'mixpanel-ruby'
gem 'ruby_parser'
gem 'rails_config'
