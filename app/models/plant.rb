# frozen_string_literal: true

class Plant < ApplicationRecord
  validates :common_name, :germination_temperature_minimum,
            :germination_temperature_maximum, :planting_depth,
            presence: true

  validates :latin_name, length: { in: 0..255 }

  # To not burden users with validations (http://blog.plataformatec.com.br/2009/08/do-not-burden-your-users-with-validations/)
  with_options allow_blank: true do |v|
    v.validates :common_name, length: { in: 0..255 }
    v.validates :germination_temperature_minimum, :germination_temperature_maximum,
                numericality: { only_integer: true, in: 0..50 }
    v.validates :germination_temperature_maximum,
                comparison: {
                  greater_than: :germination_temperature_minimum,
                  message: "(%<value>s) must be greater than germination temperature minimum (%<count>s)"
                },
                if: -> { germination_temperature_minimum.present? }
    v.validates :planting_depth, numericality: { only_integer: true, in: 0..127 }
  end
end
