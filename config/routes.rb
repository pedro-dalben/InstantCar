Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/current', to: 'users/sessions#current'
  end

  root to: 'pages#index'
  get '*path', to: 'pages#index', constraints: ->(request) { request.format.html? }
end
