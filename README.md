# MOBILE DEVELOPMENT FINAL PROJECT API v1 | Development Guide

## Ruby Version
ruby 3.2.2

## Rails Version
rails 7.1.2

## PostgresSQL configuration (development)
After Rails App is created, it is possible that it will generate an error.
To fix the problem:

* Under the project folder & the specific gemset (rvm) open the terminal and run:

        gem install pg -v 'X.X.X' -- --with-pg-config='/Applications/Postgres.app/Contents/Versions/9.6/bin/pg_config'
* Replace X.X.X for the specific version that the pg gem is requiring, for example 1.2.3
* Make sure the folder points to where you have installed PG (postgreSQL)
* After pg was successfully installed, run again

        bundle install

## Foreman (ONLY FOR DEV)
Real-time compilation gem. Follow these steps in development environment:
* Install Gem

        gem install foreman

* Create Procfile.dev in the app root folder

        # Procfile.dev        
        web: bundle exec puma -C config/puma.rb
        webpacker: ./bin/webpack-dev-server

* Start Foreman

        foreman start -f Procfile.dev

## Remove ms indicator (top left)
* Comment out the following gem


    # gem 'rack-mini-profiler'
* Or add to the url


    ?pp=disable
    ?pp=enable

## Database Setup
* The first time run

        run rake db:create

* Run migrations

        run rake db:migrate

## NGrok - Public URLs for testing Webhooks
https://dashboard.ngrok.com/get-started/setup

* To start an HTTP tunnel forwarding to your local port 3000, run this command from the folder where ngrok is located:


    >> ./ngrok http 3000

* Web interface


    http://127.0.0.1:4040/inspect/http

## Check Rails Routes from Web
* In the browser, go to:


    http://localhost:3000/rails/info/routes

## Rake Tasks (Reminder)
* Create rake task file under lib/tasks
* File must end with .task
* Follow this structure to write a rake task

      # ./lib/tasks/example.rake

      desc "Print something five times."
      task :something do
        5.times {puts "something"}
      end

* To run a rake task from the console

      >> rake "task name"

# MOBILE DEVELOPMENT FINAL PROJECT API v1 | Deployment Guide
* Deploy to Heroku via Git

* DB Migrations


    heroku run rake db:migrate --app beyond-colombia-v3-staging
    heroku run rake db:migrate --app beyond-colombia-v3-prod



# Other Topics to Include

* System dependencies

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
