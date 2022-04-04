# frozen_string_literal: true

class NavLinkDesktopComponent < ApplicationComponent
  def initialize(text, path, is_current_page)
    super

    @text = text
    @path = path
    @is_current_page = is_current_page
  end

  def call
    link_to(@text, @path, html_options)
  end

  private

  def html_options
    common_css_classes = "inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium"

    if @is_current_page
      return { class: "#{common_css_classes} border-indigo-500 text-gray-900", "aria-current": "page" }
    end

    { class: "#{common_css_classes} border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700" }
  end
end
