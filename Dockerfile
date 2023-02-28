FROM ruby:3.1.2
LABEL maintainer="seb@lewagon.org"

# make the "en_US.UTF-8" locale so ruby will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
ENV LANG en_US.utf8

# Binary dependencies for SQLite
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev curl gnupg \
    && rm -rf /var/lib/apt/lists/*
ENV FULLSTACK_FOLDER /workspace
WORKDIR $FULLSTACK_FOLDER
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs

# Binary dependencies for JS testing
RUN apt-get -y install lsof

COPY Gemfile $FULLSTACK_FOLDER/Gemfile
RUN ["bundle", "install"]
