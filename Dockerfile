# TODO: Move to a separate repo
FROM ruby:2.5.3
# TODO: Add MAINTAINER
# TODO: commit a new image having all necessary gems
# TODO: Use Gemfile!
# TODO: Copy .rubocop.yml in the image
RUN apt-get -y update && apt-get install -y sqlite3 libsqlite3-dev
RUN [ "gem", "install", "rspec", "rubocop", "nokogiri", "faker", "sinatra", "sinatra-contrib", "sqlite3", "rest-client", "pry-byebug", "rspec-rails", "activerecord:5.2.2" ]
WORKDIR /ex
ENTRYPOINT [ "rake" ]
