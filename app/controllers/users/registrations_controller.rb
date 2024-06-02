# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)

      if resource.save
        sign_in(resource_name, resource)
        render json: resource, status: :created
      else
        render json: resource.errors, status: :unprocessable_entity
      end
    end

    private

    def respond_with(resource, _opts = {})
      render json: { message: 'Signed up successfully', user: resource }, status: :ok
    end

    def respond_to_on_destroy
      head :no_content
    end

    def sign_up_params
      params.require(:user).permit(:full_name, :cpf, :birth_date, :email, :password, :password_confirmation)
    end
  end
end
