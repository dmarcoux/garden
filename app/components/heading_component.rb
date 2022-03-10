# frozen_string_literal: true

class HeadingComponent < ApplicationComponent
  HEADING_CLASSES = [
    "font-bold text-4xl",
    "font-bold text-3xl",
    "font-bold text-2xl",
    "font-bold text-xl",
    "font-bold text-lg",
    "font-bold"
  ].freeze

  def initialize(level, extra_css_classes: "")
    super

    @level = level # TODO: Raise error for passing a wrong level (only accept 1 to 6)
    @extra_css_classes = extra_css_classes
  end

  def call
    content_tag("h#{@level}", content, class: [HEADING_CLASSES[@level - 1], @extra_css_classes])
  end
end
