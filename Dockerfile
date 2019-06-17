FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /grabber
WORKDIR /grabber
ADD Gemfile /grabber/Gemfile
ADD Gemfile.lock /grabber/Gemfile.lock
RUN bundle install
ADD . /grabber

