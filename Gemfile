# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'activeadmin', '~> 2.9'
gem 'active_storage_base64', '~> 1.2'
gem 'arctic_admin', '~> 3.3'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth', '~> 1.2'
gem 'inherited_resources', '~> 1.13'
gem 'jbuilder', '~> 2.11', '>= 2.11.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sass-rails', '~> 6.0'

group :development, :test do
  gem 'bullet', '~> 6.1', '>= 6.1.5'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.19'
end

group :development do
  gem 'letter_opener', '~> 1.7'
  gem 'reek', '~> 6.0', '>= 6.0.6'
  gem 'rubocop', '~> 1.22', '>= 1.22.3'
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.4', require: false
end

group :test do
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'shoulda-matchers', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
