# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    respond_to :json
    before_action :authenticate_user!, except: [:create]
    before_action :set_user, only: %i[show update destroy]

    def index
      @users = if params[:query]
                 User.where('name LIKE ? OR cpf LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
               else
                 User.all
               end
      render json: @users
    end

    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :cpf, :birth_date, :active)
    end
  end
end
