# app/controllers/api/reservations_controller.rb
module Api
  class ReservationsController < ApplicationController
    respond_to :json
    before_action :authenticate_user!
    before_action :set_reservation, only: %i[show update destroy]

    def index
      @reservations = Reservation.all
      render json: ReservationSerializer.new(@reservations).serializable_hash.to_json
    end

    def show
      render json: ReservationSerializer.new(@reservation).serializable_hash.to_json
    end

    def create
      @reservation = current_user.reservations.new(reservation_params)
      if @reservation.save
        @reservation.vehicle.update(available: false)
        render json: ReservationSerializer.new(@reservation).serializable_hash.to_json, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    def update
      if @reservation.update(reservation_params)
        render json: ReservationSerializer.new(@reservation).serializable_hash.to_json
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @reservation.vehicle.update(available: true)
      @reservation.destroy
      head :no_content
    end

    private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:vehicle_id, :start_date, :end_date)
    end
  end
end
