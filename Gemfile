source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '~> 4.1.1'
gem 'pg'

# Auth
gem 'devise'

# Accounting
gem 'money-rails'

# Wrapbootstrap support -- START
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'  # Suggested by Bootstrap 3.2.0
gem 'font-awesome-rails'
# -- END

gem 'sass-rails'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.0'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# Forms and Form Objects
gem 'simple_form', '~> 3.1.0.rc2', github: 'plataformatec/simple_form', branch: 'master'
gem 'country_select'
gem 'virtus'

# Other javascript plugins
gem 'select2-rails'
gem 'jquery-datatables-rails', '~> 2.2.3'
gem 'bootstrap-validator-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0',          group: :doc
end

group :development do
  gem 'spring'
  gem 'annotate'
  gem 'guard-bundler',    require: false
  gem 'guard-livereload', require: false
  gem 'guard-spork',      require: false
end

group :development, :test do
  # testing
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'guard-cucumber'
  gem 'guard-rspec'

  # # opinionated console tools
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'   # This may or may not work with 2.1.2 either, so remove if you still get errorrs

  gem 'listen'
  gem 'rb-fsevent'
  gem 'spork-rails'
  gem 'growl'

  # faux factories
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'email_spec', '>= 1.2.1'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end
