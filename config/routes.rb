Rails.application.routes.draw do
  resources :countries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #====================
  # API
  #====================
  namespace :api, defaults: { format: :json } do
    # v1
    namespace :v1 do
      # resources :applications
      resources :countries
      # resources :prospects
      # resources :properties
      # resources :owners
    end

    # API v2
    # TODO: API v2
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
