# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Garden
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # See available generator options which are matching CLI options from `bundle exec rails g scaffold --help`
    # https://guides.rubyonrails.org/generators.html (search for config.generators)
    config.generators do |generator|
      # Do not generate helpers since they're unneeded most of the time
      generator.helper false

      # Do not generate RSpec specs for routes since the vast majority of routes are RESTful
      generator.test_framework :rspec, routing_specs: false
    end

    # View components
    # Preview classes of view components live in:
    config.view_component.preview_paths << Rails.root.join("app/component_previews")
    # Previews are served at (we keep the default value - http://HOST:PORT/rails/view_components)
    # config.view_component.preview_route = "/rails/view_components"
    # Set the default layout for previews (app/views/layouts/NAME.html.haml)
    # config.view_component.default_preview_layout = "view_component_previews"
  end
end
