FROM ruby:2.5.3
LABEL maintainer="andrey@lewagon.com"
# Binary dependencies for SQLite
RUN apt-get -y update && apt-get install -y sqlite3 libsqlite3-dev curl gnupg
ENV FULLSTACK_FOLDER /fullstack-challenges
WORKDIR $FULLSTACK_FOLDER
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
COPY Gemfile $FULLSTACK_FOLDER/Gemfile
RUN ["bundle", "install"]
