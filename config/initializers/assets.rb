# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.2'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('vendor','components')
Rails.application.config.assets.paths << Rails.root.join('vendor','assets')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(profile/dashboard.css profile/dashboard.js campaign_categories.css campaign_categories.js campaigns.css campaigns.js home_layout.js home_layout.css users/registrations.css users/registrations.js ckeditor/* profile.css profile.js cisa-manifest.css)
Rails.application.config.assets.precompile += %w( cisa-manifest.js )
