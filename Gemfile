source "https://rubygems.org"

ruby "3.2.2"

#===============#
# Core
#===============#
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# For HTTPS development environment
# gem 'thin'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

#===============#
# CORS
#===============#
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

#===============#
# Authentication
#===============#
gem 'devise'
# gem 'devise-jwt' # Used for API
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

#===============#
# Authorization/Roles
#===============#
# gem 'cancancan'

#===============#
# Image Handling
#===============#
gem 'carrierwave'
gem 'cloudinary'

#===============#
# Geospatial (postgreSQL extension postGIS)
#===============#
gem 'activerecord-postgis-adapter'
gem 'geocoder'

#===============#
# ENV variable handling
#===============#
gem 'dotenv-rails', groups: [:development, :test]

#===============#
# Booting
#===============#
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

#===============#
# Other
#===============#
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

#===============#
# Development & Test
#===============#
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # Debugging
  gem 'better_errors'
  gem 'awesome_print'

  # Preview emails in browser
  gem 'letter_opener'

  # Security
  gem 'brakeman'
  gem 'bundler-audit'

  # Populate DB
  gem 'faker'
end

#===============#
# Development
#===============#
group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'web-console', '>= 4.1.0'
  gem 'web-console'
end