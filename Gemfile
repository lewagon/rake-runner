source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "3.1.2"

gem "awesome_print", "~> 1.8", require: false
gem "faker", "~> 2.1"
gem "nokogiri", "~> 1.13"
gem "pry-byebug", "~> 3.7"
gem "rest-client", "~> 2.0"
gem "rspec-rails", "~> 3.8"
gem "rubocop", "~> 1.50"
gem "sinatra", "~> 2.2", require: false
gem "sinatra-contrib", "~> 2.2", require: false
gem "sqlite3", "~> 1.4"
gem "activerecord", "~> 7.0"
