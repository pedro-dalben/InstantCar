# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :vehicles, defaults: { format: :json } do
      resources :reservations, defaults: { format: :json }
    end
    resources :users, defaults: { format: :json }
  end

  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/current', to: 'users/sessions#current'
  end

  root to: 'pages#index'
  get '*path', to: 'pages#index', constraints: ->(request) { !request.xhr? && request.format.html? }
end
