FROM ruby:3.2-alpine3.18 AS base

ARG PORT=80
ARG SECRET_KEY_BASE=build
ENV BUNDLE_PATH=/var/app/vendor/bundle

RUN apk add --no-cache g++ \
  make \
  postgresql-dev \
  curl \
  libffi-dev \
  vips-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /var/app

EXPOSE ${PORT}

FROM base AS development

ENV PATH="${PATH}:/var/app/bin:$BUNDLE_PATH/bin"

COPY . .

RUN apk add --no-cache less postgresql-client git

RUN bundle install

FROM base AS production

ARG RAILS_ENV=production
ENV BUNDLE_DEPLOYMENT=true
ENV BUNDLE_WITHOUT=development:test
ENV RAILS_LOG_TO_STDOUT="enabled"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

FROM production AS staging
