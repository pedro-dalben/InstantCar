# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    def current
      if user_signed_in?
        render json: current_user
      else
        render json: { error: 'Not signed in' }, status: :unauthorized
      end
    end

    private

    def respond_with(resource, _opts = {})
      render json: resource
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end
