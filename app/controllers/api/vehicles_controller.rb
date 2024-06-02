module Api
  class VehiclesController < ApplicationController
    respond_to :json
    before_action :set_vehicle, only: %i[show update destroy]

    # GET /vehicles
    def index
      @vehicles = Vehicle.all
      render json: @vehicles
    end

    # GET /vehicles/:id
    def show
      render json: @vehicle
    end

    # POST /vehicles
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render json: @vehicle, status: :created
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /vehicles/:id
    def update
      if @vehicle.update(vehicle_params)
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    # DELETE /vehicles/:id
    def destroy
      @vehicle.destroy
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :category, :model, :license_plate)
    end
  end
end
