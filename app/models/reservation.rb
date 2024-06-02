# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :vehicle_availability

  private

  def end_date_after_start_date
    return unless end_date <= start_date

    errors.add(:end_date, 'must be after the start date')
  end

  def vehicle_availability
    overlapping_reservations = Reservation.where(vehicle_id:)
                                          .where('start_date < ? AND end_date > ?', end_date, start_date)
    return unless overlapping_reservations.exists?

    errors.add(:base, 'Vehicle is not available for the selected dates')
  end
end
