# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Cursame30Lb::Application.initialize!
#`rackup private_pub.ru -s thin -E production`

my_date_formats = { :default => '%d/%m/%Y %H:%M:%S' } 
Time::DATE_FORMATS.merge!(my_date_formats) 
Date::DATE_FORMATS.merge!(my_date_formats)