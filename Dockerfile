FROM ruby:2.5
RUN apt-get update && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      postgresql-client \
      yarn
RUN mkdir /myproject
WORKDIR /myproject
COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock
RUN gem install bundler
RUN rbenv install 2.5.8
RUN rbenv local 2.5.8
RUN bundle install
ADD . /myproject
