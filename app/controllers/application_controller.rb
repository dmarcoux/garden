# frozen_string_literal: true

require "application_responder"

class ApplicationController < ActionController::Base
  #---- Start of configuration from responders gem
  self.responder = ApplicationResponder
  respond_to :html
  # Prevent execution of controllers actions by raising `UnknownFormat` exception if the requested format was not
  # configured through the class level `respond_to`
  before_action :verify_requested_format!
  #---- End of configuration from responders gem

  include Pundit::Authorization
end
