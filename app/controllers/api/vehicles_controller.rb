module Api
  class VehiclesController < ApplicationController
    respond_to :json
    before_action :authenticate_user!
    before_action :set_vehicle, only: %i[show update destroy]

    def index
      render json: Vehicle.all
    end

    def show
      render json: @vehicle
    end

    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render json: @vehicle, status: :created
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    def update
      if @vehicle.update(vehicle_params)
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @vehicle.destroy
    end

    def options
      category = params[:category]
      brand = params[:brand]
      model = params[:model]
      license_plate = params[:license_plate]

      vehicles = Vehicle.where(available: true)
      vehicles = vehicles.where(category:) if category.present?
      vehicles = vehicles.where(brand:) if brand.present?
      vehicles = vehicles.where(model:) if model.present?
      vehicles = vehicles.where(license_plate:) if license_plate.present?

      categories = vehicles.distinct.pluck(:category)
      brands = vehicles.distinct.pluck(:brand)
      models = vehicles.distinct.pluck(:model)
      plates = vehicles.distinct.pluck(:license_plate)

      render json: {
        categories:,
        brands:,
        models:,
        vehicles: vehicles.map do |vehicle|
                    { id: vehicle.id, category: vehicle.category, brand: vehicle.brand, model: vehicle.model,
                      license_plate: vehicle.license_plate }
                  end
      }
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :category, :model, :license_license_plate)
    end
  end
end
