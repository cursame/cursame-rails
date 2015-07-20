#!/bin/bash

curl -sL https://deb.nodesource.com/setup | bash -

apt-get update
apt-get install -y \
  libbz2-dev \
  libcurl4-openssl-dev \
  libevent-dev \
  libffi-dev \
  libglib2.0-dev \
  libicu-dev \
  libjpeg-dev \
  liblzma-dev \
  libmagickcore-dev \
  libmagickwand-dev \
  libmysqlclient-dev \
  libncurses-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  nodejs \
  postgresql \
  postgresql-client \
  redis-server \
  zlib1g-dev

# rbenv
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash
chown -R vagrant:vagrant /home/vagrant/.rbenv

echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

# ruby 1.9.3
su - vagrant -c "rbenv install 1.9.3-p551 -k"
su - vagrant -c "rbenv global 1.9.3-p551"
su - vagrant -c "gem install bundle"

# postgres
su - postgres -c "createuser vagrant --no-superuser --createdb --no-createrole"
su - postgres -c "createdb vagrant"

# rails setup
echo -e "RACK_ENV=development\nRAILS_ENV=development\nPORT=3000" > /home/vagrant/source/.env
su - vagrant -c "cd /home/vagrant/source && bundle install"
su - vagrant -c "cd /home/vagrant/source && rake db:setup"
su - vagrant -c "cd /home/vagrant/source && nohup foreman start &"
