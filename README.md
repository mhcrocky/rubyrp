# Rails React Bootstrap

[![Screenshot](http://www.couriernewjersey.com/images/github-screenshot.png)](https://rails-react-bootstrap.herokuapp.com)


## Main Dependencies

* Ruby [3.1.1](https://www.ruby-lang.org/en/downloads/releases/)
* Ruby on Rails [7.0.2.3](https://rubygems.org/gems/rails/versions)
* PostgreSQL [14.0](https://www.postgresql.org/support/versioning/)
* Redis [4.5.1](https://rubygems.org/gems/redis/versions)
* Webpacker [4.3.0](https://rubygems.org/gems/webpacker/versions)
* Hotwire [0.1.3](https://rubygems.org/gems/hotwire-rails/versions)
* Turbo [1.0.1](https://rubygems.org/gems/turbo-rails/versions) (yarn)
* Stimulus [3.0.1](https://github.com/hotwired/stimulus/releases) (yarn)
* React [17.0.2](https://reactjs.org/versions/) (yarn)
* Bootstrap [5.1.3](https://getbootstrap.com/docs/versions/) (yarn)
```
Building from scratch (Not cloning or forking)
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

> PGHero: root/pghero (See /config/routes.rb)

> Brakeman + bundler_audit
```
$ brakeman
$ brakeman -o brakeman.html
$ open brakeman.html

$ bundler-audit
```
> Rspec + Simplecov
```
$ rspec
$ rspec spec/models/user_spec.rb

$ open coverage/index.html
```


## Initialization

> Replace google analytics ID

> If you don't want to verify email, comment out :confirmable in the user model and edit db/seeds

> Search and replace in project:

<details>
  <summary>rails_react_bootstrap</summary>

  1. config/cable.yml
  2. config/database.yml
  3. config/environments/production.rb
</details>

<details>
  <summary>rails-react-bootstrap</summary>

  1.  config/database.yml
  2.  config/environments/production.rb
  3.  package.json
  4.  app/javascript/packs/components/cookieBanner.jsx
  5.  app/views/devise/mailer/confirmation_instructions.html.erb
  6.  app/views/devise/mailer/email_changed.html.erb
  7.  app/views/devise/mailer/password_change.html.erb
  8.  app/views/devise/mailer/reset_password_instructions.html.erb
  9.  app/views/devise/mailer/unlock_instructions.html.erb
  10. app/views/layouts/mailer.html.erb
  11. app/views/layouts/application.html.erb
</details>

<details>
  <summary>RAILSREACTBOOTSTRAP</summary>

  1. app/mailers/application_mailer.rb
  2. config/application.rb
  3. config/database.yml
  4. config/initializers/devise.rb
</details>

<details>
  <summary>RRB</summary>

  1. app/views/devise/mailer/confirmation_instructions.html.erb
  2. app/views/pages/terms_and_conditions.html.erb
  3. app/views/pages/welcome.html.erb
  4. app/views/report_mailer/daily.html.erb
  5. app/views/shared/_footer.html.erb
</details>


## Initialization (Development)

> Run
```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
$ bin/webpack-dev-server (separate tab)
```

> Rename config/example_application.yml -> config/application.yml and define variables (figaro and .gitignore already set)

> Resetting database
```
$ rails db:drop db:create db:migrate RAILS_ENV=development
$ rails db:seed
```
> Importing Heroku database
```
$ rails db:environment:set RAILS_ENV=development
$ rails db:drop db:create db:migrate RAILS_ENV=development
$ heroku pg:backups capture DATABASE_URL
- DATABASE_URL is in your Heroku dashboard config variables. It is a valid Heroku option, so you  do not need to change the above command
$ curl -o latest.dump `heroku pg:backups public-url`
$ pg_restore --verbose --clean --no-acl --no-owner -h localhost -U LOCAL_USERNAME -d DATABASE_NAME latest.dump
- get YOUR_USERNAME on your local machine
- DATABASE_NAME can be your development/test/production db (Ex. rails_react_bootstrap_development) from your config/database.yml file.
```


## Initialization (Heroku)

> The Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli

> Buildpacks: heroku/nodejs | heroku/ruby

> Add-ons (free): Heroku Postgres | Heroku Redis | Heroku Scheduler | Rollbar | Papertrail

> example_application.yml -> personalize config vars in your heroku dashboard
```
$ heroku git:remote -a your_app_name
$ git remote rename heroku production
$ git push production master
$ heroku run rake db:schema:load
$ heroku run rake db:seed

$ heroku run rake db:migrate

$ heroku logs --tail

$ heroku restart

$ heroku run rails c
$ heroku run rake clean_ahoy
$ heroku run rake deliver_daily
```
