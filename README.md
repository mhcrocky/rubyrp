# Rails React Bootstrap

A Ruby on Rails Application that utilizes modern, lightweight frameworks and libraries to shape the frontend. The app also incorporates well-maintained gems. The mission behind the project is to bundle together the latest best practices and serve as a template for future applications.

## Main Dependencies

* Ruby [3.0.3](https://www.ruby-lang.org/en/downloads/releases/)
* Ruby on Rails [6.1.4.1](https://rubygems.org/gems/rails/versions)
* PostgreSQL [14.0](https://www.postgresql.org/support/versioning/)
* Redis [4.5.1](https://rubygems.org/gems/redis/versions)
* Webpacker [4.3.0](https://rubygems.org/gems/webpacker/versions)
* Stimulus [3.0.1](https://github.com/hotwired/stimulus/releases) (yarn)
* Hotwire [0.1.3](https://rubygems.org/gems/hotwire-rails/versions)
* Turbo [0.8.3](https://rubygems.org/gems/turbo-rails/versions) (yarn)
* React [17.0.2](https://reactjs.org/versions/) (yarn)
* Bootstrap [5.1.3](https://getbootstrap.com/docs/versions/) (yarn)
```
Building from scratch (Not .. cloning || forking)

$ ruby -v
$ rails -v
$ rails new PROJECT_NAME -d=postgresql --webpacker=react
$ pg_config --version
$ npm view react version
```


## Other Dependencies

* Devise + Rolify + Cancan
* ViewComponent
* Action Text (trix)
* will_paginate
* Chartkick + Chart.js
* Groupdate
* Ahoy
* Geocoder + maxminddb
* PGHero
* Rspec + Simplecov
* Brakeman + bundler_audit
* Figaro
* bootstrap-icons
* react-cookienotice

## Analysis, Testing and Coverage

* PGHero: root/pghero (See /config/routes.rb)
* Brakeman + bundler_audit
```
$ brakeman
$ brakeman -o brakeman.html
$ open brakeman.html

$ bundler-audit
```
* Rspec + Simplecov
```
$ rspec
$ rspec spec/models/user_spec.rb

$ open coverage/index.html
```


## Initialization

* Replace google analytics ID

* If you don't want to verify email, comment out :confirmable in the user model and edit db/seeds

* Search and replace in project:
```
rails_react_bootstrap ->
  config/cable.yml
  config/database.yml
  config/environments/production.rb

rails-react-bootstrap ->
  config/database.yml
  config/environments/production.rb
  package.json
  app/javascript/packs/components/cookieBanner.jsx
  app/views/devise/mailer/confirmation_instructions.html.erb
  app/views/devise/mailer/email_changed.html.erb
  app/views/devise/mailer/password_change.html.erb
  app/views/devise/mailer/reset_password_instructions.html.erb
  app/views/devise/mailer/unlock_instructions.html.erb
  app/views/layouts/mailer.html.erb

RAILSREACTBOOTSTRAP ->
  app/mailers/application_mailer.rb
  config/application.rb
  config/database.yml
  config/initializers/devise.rb

RRB ->
  app/views/devise/mailer/confirmation_instructions.html.erb
  app/views/pages/terms_and_conditions.html.erb
  app/views/pages/welcome.html.erb
  app/views/report_mailer/daily.html.erb
  app/views/shared/_footer.html.erb
```

## Initialization (Development)

* Run
```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
$ bin/webpack-dev-server (separate tab)
```

* Rename config/example_application.yml -> config/application.yml and define variables (figaro and .gitignore already set)

* Resetting database
```
$ rails db:drop db:create db:migrate RAILS_ENV=development
$ rails db:seed
```
* Importing Heroku database
```
$ rails db:drop db:create db:migrate RAILS_ENV=development
$ heroku pg:backups capture DATABASE_URL
$ curl -o latest.dump `heroku pg:backups public-url`
$ pg_restore --verbose --clean --no-acl --no-owner -h localhost -U LOCAL_USERNAME -d DATABASE_NAME latest.dump

- get YOUR_USERNAME on your local machine
- DATABASE_NAME can be your development/test/production db (Ex. rails_react_bootstrap_development) from your config/database.yml file.

- DATABASE_URL is not a variable or example code you need to set. It is a valid heroku option
```

## Initialization (Heroku)

* The Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
* Buildpacks: heroku/nodejs | heroku/ruby
* Add-ons (free): Heroku Postgres | Heroku Redis | Heroku Scheduler | Rollbar | Papertrail
* example_application.yml -> personalize config vars in your heroku dashboard
```
$ heroku git:remote -a your_app_name
$ git remote rename heroku production
$ git push production master
$ heroku run rake db:schema:load
$ heroku run rake db:seed
$ heroku run rake db:migrate

$ heroku run rails c
$ heroku run rake clean_ahoy
$ heroku run rake deliver_daily

$ heroku logs --tail

$ heroku restart
```
