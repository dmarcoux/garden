# frozen_string_literal: true

require "rails_helper"

RSpec.describe RenderValidationErrors do
  describe "call" do
    subject(:result) { described_class.new(html_tag, record, view_context).call }

    # Calling `valid?` on an instance of fake_model triggers the validations and generate validation errors if necessary
    let(:fake_model) do
      Class.new do
        include ActiveModel::Model

        def self.name
          "FakeModel"
        end

        attr_accessor :my_attribute

        validates :my_attribute, presence: true, length: { minimum: 3 }
      end
    end
    let(:view_context) { ActionController::Base.new.view_context }

    context "when passing a HTML tag which does not contain an input, select or textarea" do
      let(:html_tag) { "<label for='something'>Something</label>" }
      let(:record) { fake_model.new.tap(&:valid?) }

      it "returns the HTML tag" do
        expect(result).to eq(html_tag)
      end
    end

    context "when passing a HTML tag which contains an input for a model attribute with validation errors" do
      let(:html_tag) do
        '<input type="text" value="" name="fake_model[my_attribute]" id="fake_model_my_attribute" ' \
          'class="w-full border border-dashed border-gray-200">'
      end
      let(:record) { fake_model.new.tap(&:valid?) }

      it "return the HTML tag highlighted in red with a paragraph containing the validation error messages" do
        # rubocop:disable Layout/LineLength
        # Free-spacing mode for regular expression is somehow not taken into account in RSpec...
        expect(result).to match(%r{<input.*class="w-full border-solid border-2 border-red-700"><p.*>My attribute can&#39;t be blank, My attribute is too short \(minimum is 3 characters\)</p>})
        # rubocop:enable Layout/LineLength
      end
    end

    context "when passing a HTML tag which contains an input for a model attribute without validation errors" do
      let(:html_tag) { "<input type='text' value='' name='fake_model[my_attribute]' id='fake_model_my_attribute'>" }
      let(:record) { fake_model.new(my_attribute: "123").tap(&:valid?) }

      it "returns the HTML tag" do
        expect(result).to eq(html_tag)
      end
    end

    context "when passing a HTML tag which contains a textarea for a model attribute with validation errors" do
      let(:html_tag) do
        '<textarea name="fake_model[my_attribute]" id="fake_model_my_attribute" ' \
          'class="w-full border border-dashed border-gray-200"></textarea>'
      end
      let(:record) { fake_model.new.tap(&:valid?) }

      it "return the HTML tag highlighted in red with a paragraph containing the validation error messages" do
        # rubocop:disable Layout/LineLength
        # Free-spacing mode for regular expression is somehow not taken into account in RSpec...
        expect(result).to match(%r{<textarea.*class="w-full border-solid border-2 border-red-700"></textarea><p.*>My attribute can&#39;t be blank, My attribute is too short \(minimum is 3 characters\)</p>})
        # rubocop:enable Layout/LineLength
      end
    end

    context "when passing a HTML tag which contains a textarea for a model attribute without validation errors" do
      let(:html_tag) do
        '<textarea name="fake_model[my_attribute]" id="fake_model_my_attribute" ' \
          'class="w-full border border-dashed border-gray-200"></textarea>'
      end
      let(:record) { fake_model.new(my_attribute: "123").tap(&:valid?) }

      it "returns the HTML tag" do
        expect(result).to eq(html_tag)
      end
    end

    context "when passing a HTML tag which contains a select for a model attribute with validation errors" do
      let(:html_tag) do
        '<select name="fake_model[my_attribute]" id="fake_model_my_attribute" ' \
          'class="w-full border border-dashed border-gray-200"><option value="1">1</option></select>'
      end
      let(:record) { fake_model.new.tap(&:valid?) }

      it "return the HTML tag highlighted in red with a paragraph containing the validation error messages" do
        # rubocop:disable Layout/LineLength
        # Free-spacing mode for regular expression is somehow not taken into account in RSpec...
        expect(result).to match(%r{<select.*class="w-full border-solid border-2 border-red-700">.*</select><p.*>My attribute can&#39;t be blank, My attribute is too short \(minimum is 3 characters\)</p>})
        # rubocop:enable Layout/LineLength
      end
    end

    context "when passing a HTML tag which contains a select for a model attribute without validation errors" do
      let(:html_tag) do
        '<select name="fake_model[my_attribute]" id="fake_model_my_attribute" ' \
          'class="w-full border border-dashed border-gray-200"><option value="1">1</option></select>'
      end
      let(:record) { fake_model.new(my_attribute: "123").tap(&:valid?) }

      it "returns the HTML tag" do
        expect(result).to eq(html_tag)
      end
    end
  end
end
