# frozen_string_literal: true

require "rails_helper"

RSpec.describe "plants/edit", type: :view do
  let!(:plant) do
    assign(:plant, Plant.create!(
                     common_name: "MyString",
                     latin_name: "MyString",
                     germination_temperature_minimum: 1,
                     germination_temperature_maximum: 2,
                     planting_depth: 1
                   ))
  end

  it "renders the edit plant form" do
    render

    assert_select "form[action=?][method=?]", plant_path(plant), "post" do
      assert_select "input[name=?]", "plant[common_name]"

      assert_select "input[name=?]", "plant[latin_name]"

      assert_select "input[name=?]", "plant[germination_temperature_minimum]"

      assert_select "input[name=?]", "plant[germination_temperature_maximum]"

      assert_select "input[name=?]", "plant[planting_depth]"
    end
  end
end
