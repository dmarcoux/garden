# frozen_string_literal: true

class NavLinkComponent < ApplicationComponent
  def initialize(text, path, is_current_page)
    super

    @text = text
    @path = path
    @is_current_page = is_current_page
  end

  def call
    # TODO: Raise with an error message like: Call me with a variant: ":desktop" or "mobile"
  end

  def call_desktop
    @css_classes = "inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium"

    link_to(@text, @path, desktop_html_options)
  end

  def call_mobile
    @css_classes = "block pl-3 pr-4 py-2 border-l-4 text-base font-medium"

    link_to(@text, @path, mobile_html_options)
  end

  private

  def desktop_html_options
    return { class: "#{@css_classes} border-indigo-500 text-gray-900", "aria-current": "page" } if @is_current_page

    { class: "#{@css_classes} border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700" }
  end

  def mobile_html_options
    if @is_current_page
      return { class: "#{@css_classes} bg-indigo-50 border-indigo-500 text-indigo-700",
               "aria-current": "page" }
    end

    { class: "#{@css_classes} border-transparent text-gray-600 " \
             "hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800" }
  end
end
