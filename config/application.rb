require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module VirtualMuseum
  class Application < Rails::Application

    #autoload subdirectories of app/models
    # http://stackoverflow.com/questions/18934115/rails-4-organize-rails-models-in-sub-path-without-namespacing-models
    # config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]

    # don't generate RSpec tests for views and helpers
    config.generators do |g|

      g.test_framework      :rspec,        fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.view_specs   false
      g.helper_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "Europe/London"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.initialize_on_precompile = false

    config.lograge.static_data = { site: ENV['SITE'] }

    config.rakismet.key  = ENV['WORDPRESS_KEY']
    config.rakismet.url  = ENV['SITE']
    # Rakismet default is test is false
    config.rakismet.test = true if ENV['RAKISMET_TEST'] == 'true'

    config.autoload_paths << Rails.root.join('lib') if Rails.env.development?


  end
end
