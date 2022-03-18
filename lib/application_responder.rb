# frozen_string_literal: true

class ApplicationResponder < ActionController::Responder
  # Sets the flash message based on the controller action and resource status.
  # For instance, if you do: `respond_with(@post)` on a POST request and the resource `@post` does not contain errors,
  # it will automatically set the flash message to "Post was successfully created".
  # Change the flash messages in config/locales/responders.en.yml
  include Responders::FlashResponder
  # Automatically adds Last-Modified headers to API requests. This allows clients to easily query the server if a
  # resource changed and if the client tries to retrieve a resource that has not been modified, it returns
  # not_modified status
  include Responders::HttpCacheResponder

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder
end
