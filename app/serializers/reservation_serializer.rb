# frozen_string_literal: true

class ReservationSerializer
  include JSONAPI::Serializer

  attributes :start_date, :end_date, :created_at, :updated_at

  attribute :formatted_start_date do |reservation|
    reservation.start_date.strftime('%d/%m/%Y')
  end

  attribute :formatted_end_date do |reservation|
    reservation.end_date.strftime('%d/%m/%Y')
  end

  attribute :client_name do |reservation|
    reservation.user.full_name
  end

  attribute :vehicle_details do |reservation|
    vehicle = reservation.vehicle
    {
      category: vehicle.category,
      brand: vehicle.brand,
      model: vehicle.model,
      license_plate: vehicle.license_plate
    }
  end
end
