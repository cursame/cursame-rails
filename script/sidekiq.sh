#!/bin/sh

exec chpst -u bundle exec sidekiq -e production -P /var/run/sidekiq/sidekiq.pid
