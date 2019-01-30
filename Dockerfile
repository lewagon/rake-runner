FROM ruby:2.5.3
LABEL maintainer="andrey@lewagon.com"
# Binary dependencies for SQLite
RUN apt-get -y update && apt-get install -y sqlite3 libsqlite3-dev
ENV FULLSTACK_FOLDER /fullstack-challenges
WORKDIR $FULLSTACK_FOLDER
COPY Gemfile $FULLSTACK_FOLDER/Gemfile
RUN ["bundle", "install"]
