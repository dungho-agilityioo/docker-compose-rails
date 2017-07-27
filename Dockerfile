#Get base ruby 2.4
FROM ruby:2.4

MAINTAINER dung.hoduy@asnet.com.vn

RUN apt-get update -qq \
	&& apt-get install -y build-essential libpq-dev nodejs \
	&& rm -rf /var/lib/apt/lists
ENV HOME_PATH /home/app
RUN mkdir $HOME_PATH
WORKDIR $HOME_PATH
ADD Gemfile $HOME_PATH/Gemfile
ADD Gemfile.lock $HOME_PATH/Gemfile.lock

ENV BUNDLE_GEMFILE=$HOME_PATH/Gemfile \
	BUNDLE_JOBS=2 \
	BUNDLE_PATH=/bundle

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
ADD . $HOME_PATH

EXPOSE 3000