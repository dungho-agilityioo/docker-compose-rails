# Base image is ruby
FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV HOME_PATH /home/app

WORKDIR $HOME_PATH

RUN gem install bundler

ADD Gemfile* $HOME/

RUN bundle install

ADD . $HOME_PATH
