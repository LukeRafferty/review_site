source 'https://rubygems.org/'
ruby '2.3.3'
gem 'rails', '5.0.0.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'rails-assets-foundation', source: 'https://rails-assets.org'
gem 'devise'
gem 'active_model_serializers'
gem 'httparty'
gem 'dotenv'
gem 'fog-aws'

group :test do
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'carrierwave'
end

group :test do
  gem 'launchy', require: false
end

group :production do
  gem 'rails_12factor'
end
