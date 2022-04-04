# frozen_string_literal: true

class NavLinkMobileComponent < ApplicationComponent
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
    common_css_classes = "block pl-3 pr-4 py-2 border-l-4 text-base font-medium"

    if @is_current_page
      return { class: "#{common_css_classes} bg-indigo-50 border-indigo-500 text-indigo-700",
               "aria-current": "page" }
    end

    { class: "#{common_css_classes} border-transparent text-gray-600 " \
             "hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800" }
  end
end
