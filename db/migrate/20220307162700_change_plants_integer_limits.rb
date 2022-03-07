# frozen_string_literal: true

class ChangePlantsIntegerLimits < ActiveRecord::Migration[7.0]
  def up
    change_table(:plants) do |t|
      t.change(:germination_temperature_minimum, :integer, limit: 1)
      t.change(:germination_temperature_maximum, :integer, limit: 1)
      t.change(:planting_depth, :integer, limit: 1)
    end
  end

  def down
    change_table(:plants) do |t|
      t.change(:germination_temperature_minimum, :integer, limit: nil)
      t.change(:germination_temperature_maximum, :integer, limit: nil)
      t.change(:planting_depth, :integer, limit: nil)
    end
  end
end
