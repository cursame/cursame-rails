#!/bin/sh

exec chpst bundle exec sidekiq -e production -P /var/run/sidekiq/sidekiq.pid
