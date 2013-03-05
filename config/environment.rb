# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Cursame30Lb::Application.initialize!
#`rackup private_pub.ru -s thin -E production`
`rackup private_pub.ru -s unicorn -E production`
