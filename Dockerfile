FROM ruby:2.5.3
LABEL maintainer="andrey@lewagon.com"
# Binary dependencies for SQLite
RUN apt-get -y update && apt-get install -y sqlite3 libsqlite3-dev
ENV STUDENT_CODE_FOLDER /ex
WORKDIR $STUDENT_CODE_FOLDER
COPY Gemfile $STUDENT_CODE_FOLDER/Gemfile
RUN ["bundle", "install"]
# Can be overrun with
# `docker run -it --entrypoint "bash" progapandist/rake-runner`
# for local image debugging.
ENTRYPOINT [ "rake" ]
