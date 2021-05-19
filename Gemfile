source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
# gem 'kaminari', '~> 0.17.0'
# gem 'kaminari-bootstrap', '~> 3.0.1'
gem "faker" , '1.7.3'
gem 'will_paginate',           '3.1.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'gravtastic'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
gem 'bootstrap-sass','3.3.7'
gem 'bootstrap', '~> 4.1.1'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma',         '4.3.8'
gem 'bcrypt',         '3.1.12'
# Use SCSS for stylesheets
gem 'sass-rails',   '5.0.6'# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',     '3.2.0'# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'jquery-rails', '4.3.1'
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks',   '5.0.1'# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',     '2.7.0'# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'sqlite3', '1.3.13'
end


group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
   gem 'rb-readline'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'rails-controller-testing', '1.0.2'

  gem 'minitest',                 '5.10.3'

  gem 'minitest-reporters',       '1.1.14'

  gem 'guard',                    '2.13.0'

  gem 'guard-minitest',           '2.4.4'

end
group :production do

  gem 'pg', '0.20.0'


end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
