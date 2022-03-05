# frozen_string_literal: true

require "rails_helper"

RSpec.describe "plants/show", type: :view do
  before do
    assign(:plant, Plant.create!(
                     common_name: "Common Name",
                     latin_name: "Latin Name",
                     germination_temperature_minimum: 2,
                     germination_temperature_maximum: 3,
                     planting_depth: 4
                   ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Common Name/)
    expect(rendered).to match(/Latin Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
