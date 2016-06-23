source 'https://rubygems.org'
ruby IO.read(File.dirname(__FILE__) + "/.ruby-version").strip

gem 'rails', '4.1.4'
gem 'rake'
gem 'pg'

gem 'sass-rails', '~> 4.0.3'
gem 'sprockets-image_compressor'
gem 'sprockets-webp'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'font-awesome-rails'
gem 'bootstrap-sass', '2.3.2.2'
gem 'responders'
gem 'nested_form'

gem 'devise'
gem 'figaro'
gem 'simple_form'
gem 'parslet'
gem 'decent_exposure'
gem 'draper'
gem 'diffy'
gem 'haml'
gem 'redcarpet'
gem 'authority'
gem 'kaminari'
gem 'omniauth-twitter'
gem 'rakismet', github: "hedtek/rakismet"
gem 'secretary-rails'
gem 'carrierwave'
gem 'rails4-autocomplete'

gem 'passenger' #todo should only be in production I think, pma is missing but piced up by puma-guard below
gem 'newrelic_rpm'
gem 'lograge_params', github: "hedtek/lograge-params"
gem 'jquery-ui-rails'

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-puma'
  gem 'guard-rake'
  gem 'guard-cucumber'

  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'email_spec'
  gem 'launchy'
  gem 'minitest'
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'simplecov', require: false
end

group :development do
  gem 'meta_request'
  gem 'xray-rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara-screenshot'
end