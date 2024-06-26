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

      # Prospects
      resources :prospects

      # Owners
      resources :owners # TODO: to display Owners properties I will use a collection with properties asociated to the Owner

      # Properties
      resources :properties do
        member do
          # /owners/:id/properties/:id/property_images
          resources :property_images
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
