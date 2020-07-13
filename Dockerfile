## For MySQL running on host Environment.

# FROM ruby:2.5.1
# RUN apt-get update
# RUN apt-get install -y mysql-client nodejs vim --no-install-recommends
# RUN rm -rf /var/lib/apt/lists/*
# RUN mkdir /myproject
# WORKDIR /myproject
# ADD Gemfile /myproject/Gemfile
# ADD Gemfile.lock /myproject/Gemfile.lock
# RUN gem install bundler
# ADD . /myproject
# RUN rm /myproject/Gemfile.lock
# RUN bundle install


## For Postgresql running on container environment

FROM ruby:2.5
RUN apt-get update && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      postgresql-client \
      yarn
# RUN rm -rf /var/lib/apt/lists/*
RUN mkdir /myproject
WORKDIR /myproject
COPY Gemfile Gemfile.lock /myproject/
RUN rm /myproject/Gemfile.lock
RUN gem install bundler
# RUN bundler update
RUN bundle install
