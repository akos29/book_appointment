Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :yachts, only: [:index, :create, :show, :destroy], defaults: {format: 'json'} do
    resources :reservations, only: [:create, :index, :destroy]
  end
  
  namespace :api do
    namespace :v1 do
      resources :yachts, only: [:show]
    end
  end

  root "yachts#index"
end
