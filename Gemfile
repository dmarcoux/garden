# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.1"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
# Read, write, modify, and query XML/HTML documents
gem "nokogiri"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma"
# Authorization system
gem "pundit"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails"
# Use Redis adapter to run Action Cable in production
# gem "redis"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use sqlite3 as the database for Active Record
gem "sqlite3"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Catch unsafe database migrations in development
gem "strong_migrations"
# Utility-first CSS framework
gem "tailwindcss-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# Create reusable, testable & encapsulated view components
gem "view_component"

group :development, :test do
  # Analyze code for security vulnerabilities
  gem "brakeman"
  # Analyze gems for known vulnerabilities
  gem "bundler-audit"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  # All runtime config comes from the UNIX environment, but we use dotenv to
  # store that in files for development and testing
  gem "dotenv-rails"
  # Linter for ERB
  gem "erb_lint", require: false
  # Create fixtures (sample data) for specs
  gem "factory_bot_rails"
  # Behaviour Driven Development for Ruby
  gem "rspec"
  # Behaviour Driven Development for Rails
  gem "rspec-rails"
  # Linter for Ruby
  gem "rubocop", require: false
  # Linter for performance checks in Ruby
  gem "rubocop-performance", require: false
  # Linter for Rails
  gem "rubocop-rails", require: false
  # Linter for RSpec
  gem "rubocop-rspec", require: false
end

group :test do
  # Acceptance test framework for system testing (https://guides.rubyonrails.org/testing.html#system-testing)
  gem "capybara"
  # Driver used by capybara to execute tests
  gem "selenium-webdriver"
  # Easily install and update all supported webdrivers for Selenium
  gem "webdrivers"
end
