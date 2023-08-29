Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :yachts, only: [:index, :create], defaults: {format: 'json'}

  namespace :api do
    namespace :v1 do
      resources :yachts, only: [:show]
    end
  end

  root "yachts#index"
end
