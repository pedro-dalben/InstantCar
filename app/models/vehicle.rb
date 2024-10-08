# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :brand, :category, :model, :license_plate, presence: true
  validates :license_plate, uniqueness: true, presence: true
end
