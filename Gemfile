source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'google-api-client', '~> 0.10'
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'koala'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'
gem 'paperclip'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'rubocop', require: false
gem 'resque'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sqlite3'
gem 'therubyracer'
gem 'trix'
gem 'twitter'
gem 'vkontakte_api', '~> 1.4'
gem 'feedjira'
gem 'will_paginate'
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'odnoklassniki'
gem 'omniauth-odnoklassniki'
gem 'vcr'
gem 'webmock'
gem "font-awesome-rails"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

ruby '2.3.1'
