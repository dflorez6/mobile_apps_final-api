Rails.application.routes.draw do
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
      resources :countries # TODO: only GET, restrict the other endpoints

      resources :applications
      resources :prospects

      # Owners > Properties
      resources :owners do
        member do
          resources :properties
        end
      end

    end

    # API v2
    # TODO: API v2
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
