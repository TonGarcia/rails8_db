require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

require "rails_db"

begin
  Ransack::Adapters::ActiveRecord::Base.class_eval('remove_method :search')
rescue Exception
end

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.hosts.clear

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    # Configure asset pipeline
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    
    # Add gem assets to the asset pipeline
    gem_path = Rails.root.join('../../..').to_s
    
    # Configure Propshaft
    if defined?(Propshaft)
      config.assets.configure do |env|
        env.append_path File.join(gem_path, 'app/assets')
        env.append_path File.join(gem_path, 'app/assets/images')
      end
    end
  end
end

