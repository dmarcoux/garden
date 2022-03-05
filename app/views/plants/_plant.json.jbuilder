# frozen_string_literal: true

json.extract! plant, :id, :common_name, :latin_name, :germination_temperature_minimum,
              :germination_temperature_maximum, :planting_depth, :created_at, :updated_at
json.url plant_url(plant, format: :json)
