FROM ruby:3.3.7
LABEL maintainer="seb@lewagon.org"

# make the "en_US.UTF-8" locale so ruby will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
ENV LANG en_US.utf8

# Node
ARG NODE_VERSION=14.21.3
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && rm -rf /tmp/node-build-master

# Binary dependencies for SQLite
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev curl gnupg \
    && rm -rf /var/lib/apt/lists/*
ENV FULLSTACK_FOLDER /workspace
ENV RUBOCOP_CACHE_ROOT /workspace
WORKDIR $FULLSTACK_FOLDER

COPY Gemfile $FULLSTACK_FOLDER/Gemfile
RUN ["bundle", "install"]

# Run and own only the runtime files as a non-root user for security
RUN useradd ruby --create-home --shell /bin/bash && chown -R ruby:ruby $FULLSTACK_FOLDER
USER ruby:ruby
