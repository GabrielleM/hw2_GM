source 'http://rubygems.org'
gem 'haml'

gem 'rails', '3.1.0'
#gem 'rails', '3.2.8' # Mar 7, 2013

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19' #:require => 'ruby-debug'
end
group :production do
  gem 'therubyracer-heroku', :platform => :ruby
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger

