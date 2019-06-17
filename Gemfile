source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_pry'
gem 'dotenv'
gem 'dry-initializer', '~> 2.5.0'
gem 'faraday', '~> 0.10'
gem 'faraday_middleware'
gem 'faraday_middleware-parse_oj'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'active_record-annotate', git: 'https://github.com/7even/active_record-annotate.git',
                                ref: 'd4ab3e9662033f1b7a2ae288a10947da506bf931'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
