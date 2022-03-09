# frozen_string_literal: true

require "rails_helper"

RSpec.describe "plants/index", type: :view do
  before do
    assign(:plants, [
             Plant.create!(
               common_name: "Common Name",
               latin_name: "Latin Name",
               germination_temperature_minimum: 2,
               germination_temperature_maximum: 3,
               planting_depth: 4
             ),
             Plant.create!(
               common_name: "Common Name",
               latin_name: "Latin Name",
               germination_temperature_minimum: 2,
               germination_temperature_maximum: 3,
               planting_depth: 4
             )
           ])
  end

  it "renders a list of plants" do
    render
    assert_select "div>h2", text: /Common Name/, count: 2
    assert_select "div>p", text: /Latin Name/, count: 2
    assert_select "div>p", text: /2/, count: 2
    assert_select "div>p", text: /3/, count: 2
    assert_select "div>p", text: /4/, count: 2
  end
end
