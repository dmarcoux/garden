# frozen_string_literal: true

# A field with validation errors is highlighted in red and those errors are displayed directly under the field
# Implementation inspired by https://www.jorgemanrubia.com/2019/02/16/form-validations-with-html5-and-modern-rails/
class RenderValidationErrors
  def initialize(html_tag, record, view_context)
    @html_tag = html_tag
    @record = record
    @view_context = view_context
    @field = Nokogiri::HTML.fragment(html_tag).at("input,select,textarea")
  end

  def call
    # Only fields possibly have validation errors, so we return the HTML tag since it's not a field
    return @html_tag unless @field

    # The field doesn't have a validation error, so we return its HTML
    return @html_tag if attribute_error_messages.empty?

    # Any CSS class matching the regular expression is replaced by a space, to avoid having two CSS classes without a
    # space between them
    @field["class"] = "#{(@field['class'] || '').gsub(regex, ' ')} border-solid border-2 border-red-700".squeeze(" ")

    # rubocop:disable Rails/OutputSafety
    # The CSS classes of the field were changed, but it's not user input, so it's safe.
    @field.to_s.html_safe.concat(
      @view_context.content_tag(:p,
                                class: "bg-red-50 text-red-700 px-3 py-2 font-medium rounded-lg mt-3 col-span-full") do
        attribute_error_messages.join(", ")
      end
    )
    # rubocop:enable Rails/OutputSafety
  end

  private

  # Fetch all error messages for the record attribute (if it has any error...)
  def attribute_error_messages
    @attribute_error_messages ||= begin
      attribute = @field.attributes["name"].value[/\[(?<name>.*)\]/, :name]
      @record.errors.full_messages_for(attribute)
    end
  end

  # CSS classes like `border`, `border-black`, and `border-gray-200` will match the regular expression
  def regex
    /
      \s? # a space or nothing
      border # the word `border`
      (-?\w*)* # with or without dashes, followed by any amount of letter, number or underscore
      \s? # a space or nothing
    /x # free-spacing mode
  end
end
