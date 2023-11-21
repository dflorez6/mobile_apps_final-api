# exit on error
set -o errexit

bundle install
bundle exec rails db:migrate
bundle exec rails db:seed

# Not needed because this is an API
# bundle exec rails assets:clean
# bundle exec rails assets:precompile
