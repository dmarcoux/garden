# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing"

# Utility-first CSS framework
gem "tailwindcss-rails"

# Authorization system
gem "pundit"

# Create reusable, testable & encapsulated view components
gem "view_component"

# Catch unsafe database migrations in development
gem "strong_migrations"

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

# group :development do

# end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
