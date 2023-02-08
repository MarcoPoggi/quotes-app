FROM ruby:3.2-alpine
	
ARG BUILD_PACKAGES="build-base"
ARG DEV_PACKAGES="postgresql-dev"
ARG RUBY_PACKAGES="bash tzdata git"

RUN apk update && apk upgrade && \
    apk add --update --no-cache \
    $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES

ENV BUNDLER_VERSION 2.3.20
RUN gem update --system
RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR /app