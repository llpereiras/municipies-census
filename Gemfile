# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'bootsnap', require: false
gem 'cpf_cnpj'
gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'phonelib'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8'
gem 'solid_queue'
gem 'sprockets-rails'
gem 'tailwindcss-rails'
gem 'twilio-ruby', '~> 6.9.0'
gem 'tzinfo-data'

group :development, :test do
  gem 'debug'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'rails-controller-testing'

  gem 'rspec-rails', '~> 6.0'
  gem 'rubocop', '~> 1.57'
  gem 'rubocop-performance', '~> 1.19'
  gem 'rubocop-rails', '~> 2.21'
  gem 'rubocop-rspec', '~> 2.24'
end

group :development do
  gem 'web-console'
end
