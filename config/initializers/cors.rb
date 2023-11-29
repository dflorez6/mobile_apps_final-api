# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TODO: For now Im on development environment so I will accept incoming requests from ng serve only. Find a solution for the app in production
    # origins 'http://localhost:4200' # You can set specific origins if needed, e.g., 'http://localhost:3000'
    # TODO: According to GPT to do it with an APK angular/cordova
    origins 'content://', 'file://', /\Ahttp(s)?:\/\/localhost(:\d+)?\z/

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true
  end
end