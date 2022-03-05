# frozen_string_literal: true

class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :latin_name
      t.integer :germination_temperature_minimum
      t.integer :germination_temperature_maximum
      t.integer :planting_depth

      t.timestamps
    end
  end
end
