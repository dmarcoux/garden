# frozen_string_literal: true

class RequiredFieldAsteriskComponent < ApplicationComponent
  def call
    tag.abbr("*", class: "text-red-600 text-lg", title: "required")
  end
end
