# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.2"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

gem "dry-monads", require: false

# ActiveAdmin
gem "activeadmin"

# Authentication
gem "devise"
gem "devise_invitable"

# Elements production upload
gem "aws-sdk-s3", require: false

# Validations for activestorage types
gem "activestorage-validator"

# Tags
gem "acts-as-taggable-on"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # codestyle
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false

  gem "letter_opener"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  # spring & guard
  gem "guard-rspec", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "terminal-notifier"
  gem "terminal-notifier-guard"
end

group :test do
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "faker"
  gem "rails-controller-testing"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
