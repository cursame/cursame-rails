# See https://github.com/cursame/cursame/wiki/Docker
FROM phusion/passenger-ruby19
MAINTAINER Luis Alfredo Lorenzo <luis@cursa.me>

ENV HOME /root
ENV RAILS_ENV production

# use baseimage-docker's init process
CMD ["/sbin/my_init"]

# install dependencies
RUN apt-get update && apt-get install -y \
    libicu-dev

# install imagemagick
RUN apt-get update && apt-get install -y \
    imagemagick \
    libmagick++-dev \
    libmagic-dev

# start nginx/passenger
RUN rm -f /etc/service/nginx/down

# remove the default site
RUN rm /etc/nginx/sites-enabled/default

# add nginx config file
COPY .nginx/cursame.conf /etc/nginx/sites-enabled/cursame.conf

# add environment variables in nginx
COPY .nginx/env.conf /etc/nginx/main.d/env.conf

# set up working directory
RUN mkdir /home/app/cursame
WORKDIR /home/app/cursame

# caching bundler
COPY Gemfile /home/app/cursame/
COPY Gemfile.lock /home/app/cursame/
RUN bundle install --without development test

# deploy app
COPY . /home/app/cursame
RUN chown app:app -R /home/app/cursame
