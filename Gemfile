source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "3.3.7"

gem "awesome_print", "~> 1.9", require: false
gem "faker", "~> 3.5"
gem "nokogiri", "~> 1.18"
gem "pry-byebug", "~> 3.10"
gem "rest-client", "~> 2.1"
gem "rspec-rails", "~> 3.8"
gem "rubocop", "~> 1.74"
gem "sinatra", "~> 2.2", require: false
gem "sinatra-contrib", "~> 2.2", require: false
gem "sqlite3", "~> 1.7.3"
gem "activerecord", "~> 7.1"
