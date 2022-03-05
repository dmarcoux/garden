# frozen_string_literal: true

FactoryBot.define do
  factory :plant do
    common_name { "MyString" }
    latin_name { "MyString" }
    germination_temperature_minimum { 1 }
    germination_temperature_maximum { 1 }
    planting_depth { 1 }
  end
end
