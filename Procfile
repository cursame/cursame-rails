web:    bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -e $RACK_ENV -c 3
worker: bundle exec rackup private_pub.ru -s thin -E production