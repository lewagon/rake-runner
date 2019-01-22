source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.3'

# QUESTION: Do we need to lock them to specific versions?
gem 'awesome_print', require: false
gem 'faker'
gem 'nokogiri'
gem 'pry-byebug'
gem 'rest-client'
gem 'rspec-rails'
gem 'rubocop'
gem 'sinatra', '~> 2.0', '>= 2.0.2', require: false
gem 'sinatra-contrib', '~> 2.0', '>= 2.0.2', require: false
gem 'sqlite3'
gem 'activerecord', '~> 5.2'
