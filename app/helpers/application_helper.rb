# frozen_string_literal: true

module ApplicationHelper
  def website_title
    "#{I18n.t(:website_title)} - #{page_title}"
  end

  def page_title
    # Pass a custom page title in a view with:
    # <%= content_for(:page_title, I18n.t(".page_title", some_interpolation: @something.name)) %>
    # Otherwise, look up the translation based on the controller path and action name
    @page_title ||= content_for(:page_title).presence ||
                    I18n.t("#{controller_path.tr('/', '.')}.#{action_name}.page_title")
  end
end
