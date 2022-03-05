# frozen_string_literal: true

require "rails_helper"

RSpec.describe "plants/new", type: :view do
  before do
    assign(:plant, Plant.new(
                     common_name: "MyString",
                     latin_name: "MyString",
                     germination_temperature_minimum: 1,
                     germination_temperature_maximum: 1,
                     planting_depth: 1
                   ))
  end

  it "renders new plant form" do
    render

    assert_select "form[action=?][method=?]", plants_path, "post" do
      assert_select "input[name=?]", "plant[common_name]"

      assert_select "input[name=?]", "plant[latin_name]"

      assert_select "input[name=?]", "plant[germination_temperature_minimum]"

      assert_select "input[name=?]", "plant[germination_temperature_maximum]"

      assert_select "input[name=?]", "plant[planting_depth]"
    end
  end
end
