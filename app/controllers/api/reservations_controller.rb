# app/controllers/api/reservations_controller.rb
module Api
  class ReservationsController < ApplicationController
    respond_to :json
    before_action :authenticate_user!, except: :by_period
    before_action :authenticate_with_basic_auth, only: :by_period
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

    def by_period
      start_date = params[:start_date]
      end_date = params[:end_date]
      @reservations = Reservation.where(start_date: start_date..end_date).or(Reservation.where(end_date: start_date..end_date))
      render json: ReservationSerializer.new(@reservations).serializable_hash.to_json
    end

    private

    def authenticate_with_basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['API_USERNAME'] && password == ENV['API_PASSWORD']
      end
    end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:vehicle_id, :start_date, :end_date)
    end
  end
end
