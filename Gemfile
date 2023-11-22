source 'https://rubygems.org'

ruby '3.2.2'

#gem 'haml'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1.1'
gem 'turbo-rails'
gem 'stimulus-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'json', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'


# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.1.0', group: :doc
gem 'devise'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootsnap'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap-datepicker-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3', '~> 1.4'
  gem 'capybara'
  gem 'rspec', '~>3.5'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'spring'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

group :test do
  gem 'rspec-expectations'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'simplecov'
end

group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'
end