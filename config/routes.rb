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
      # Authentication
      post 'owners/login', to: 'authentications#login_owner'
      post 'prospects/login', to: 'authentications#login_prospect'

      # Home Properties
      get 'properties', to: 'properties#index' # Used in the mobile app Home

      # Prospects
      resources :prospects

      # Owners > Properties
      resources :owners do
        member do
          # /owners/:id/properties
          resources :properties, except: [:index] do
            member do
              # /owners/:id/properties/:id/property_images
              resources :property_images
            end
          end
        end
      end

      # Prospect Applications
      resources :applications

      # Lookup
      resources :property_types, only: [:index, :show] # Restricting routes
      resources :countries, only: [:index, :show]

    end

    # API v2
    # TODO: API v2
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
