FROM ruby:2.5.3
LABEL maintainer="andrey@lewagon.com"

# make the "en_US.UTF-8" locale so ruby will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Binary dependencies for SQLite
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev curl gnupg
ENV FULLSTACK_FOLDER /fullstack-challenges
WORKDIR $FULLSTACK_FOLDER
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs

COPY Gemfile $FULLSTACK_FOLDER/Gemfile
RUN ["bundle", "install"]
