source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
# gem 'pg', '~> 0.18'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem "figaro"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'guard-rspec', require: false
  gem 'factory_bot_rails'
  gem "wisper-rspec", :github => "krisleech/wisper-rspec"
  gem 'capybara'
  gem 'rubocop', require: false
  gem 'launchy'
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'activeadmin'
gem 'active_material', github:'vigetlabs/active_material'
gem 'devise'
gem "rectify"
gem "typhoeus"
gem "simple_form"
gem 'paystack'
gem "que"
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'statesman', '~> 3.4.1'
gem 'statesman-events'
gem 'friendly_id', '~> 5.1.0'
gem 'valid_email'
gem "twitter-bootstrap-rails"
gem 'jquery-datatables'
gem 'jquery-rails'
gem "paperclip", "~> 5.0.0"
gem 'ckeditor'
gem 'select2-rails'
gem 'bootstrap-popover-rails'
gem 'metamagic'
gem 'bootstrap-wysihtml5-rails'
gem 'font-awesome-rails'
gem 'impressionist' #for the number of impression on the show page to be counted
gem 'turbolinks', '~> 5'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'mail_form'
gem 'liquid', '~> 3.0', '>= 3.0.6'
