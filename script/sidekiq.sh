#!/bin/sh

exec chpst bundle exec sidekiq -e subtest -P /var/run/sidekiq/sidekiq.pid
