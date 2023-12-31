# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( cart.css )
Rails.application.config.assets.precompile += %w( chartkick.js )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( create-listing.css )
Rails.application.config.assets.precompile += %w( notifications.css )
Rails.application.config.assets.precompile += %w( user.css )
Rails.application.config.assets.precompile += %w( reviews.css )
Rails.application.config.assets.precompile += %w( edit-listings.css )


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
