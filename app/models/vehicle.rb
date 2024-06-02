# frozen_string_literal: true

class Vehicle < ApplicationRecord
  validates :brand, :category, :model, :license_plate, presence: true
  validates :license_plate, uniqueness: true
end
