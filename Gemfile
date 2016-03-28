source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'pg'                                              # postgres support
gem 'sass-rails'                                      # compile sass/scss to css
gem 'bootstrap-sass'
gem 'uglifier'                                        # asset compression
gem 'jquery-rails'                                    # jquery & ujs integration
gem 'turbolinks'
gem 'showdown-rails'
gem 'carrierwave'
gem 'fog', require: 'fog/aws'

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'guard-rspec'
  gem 'database_cleaner'
end

group :development do
  gem 'better_errors'                                 # debugger for error pages
end

group :development, :test do
  gem 'byebug'                                        # debugger
end
