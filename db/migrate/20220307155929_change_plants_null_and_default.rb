# frozen_string_literal: true

class ChangePlantsNullAndDefault < ActiveRecord::Migration[7.0]
  def change
    change_table(:plants) do |t|
      t.change_null(:common_name, false)
      t.change_default(:latin_name, from: nil, to: "")
      t.change_null(:latin_name, false)
      t.change_null(:germination_temperature_minimum, false)
      t.change_null(:germination_temperature_maximum, false)
      t.change_null(:planting_depth, false)
    end
  end
end
