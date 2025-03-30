# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

gem_path = Gem.loaded_specs['rails_db'].full_gem_path
puts "Rails DB gem path: #{gem_path}"
full_path = gem_path + "/app/assets/images/rails_db"
puts "Full asset path: #{full_path}"
Rails.application.config.assets.paths << full_path
