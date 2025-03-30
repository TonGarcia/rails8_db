# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Add RailsDB gem assets to the asset pipeline
gem_path = Rails.root.join('../../..').to_s

# Configure Propshaft
Rails.application.config.assets.configure do |env|
  # Add the gem's asset paths
  env.append_path File.join(gem_path, 'app/assets')
  env.append_path File.join(gem_path, 'app/assets/images')
  
  # Configure Propshaft to handle the assets
  if defined?(Propshaft)
    env.append_path File.join(gem_path, 'app/assets')
    env.append_path File.join(gem_path, 'app/assets/images')
  end
end

# Precompile additional assets
Rails.application.config.assets.precompile += %w( rails_db/logo.png rails_db/logo_mini.png )
