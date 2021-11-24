FROM ruby:alpine3.14
MAINTAINER Zach Latta <zach@zachlatta.com>

RUN apk update \
 && apk add --no-cache alpine-sdk git icu-dev cmake openssl-dev

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock

ENV BUNDLE_GEMFILE=Gemfile \
  BUNDLE_JOBS=4

RUN bundle install

ADD . /usr/src/app

CMD ["bin/start"]
