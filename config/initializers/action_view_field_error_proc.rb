# frozen_string_literal: true

# Change how validation errors in forms are rendered
# Details on this configuration at https://guides.rubyonrails.org/configuring.html#config-action-view-field-error-proc
# Passing a Proc is needed, but we're calling a class to easily test this code
Rails.application.configure do
  config.action_view.field_error_proc = proc { |html_tag, tag_instance|
    RenderValidationErrors.new(html_tag, tag_instance.object, self).call
  }
end
