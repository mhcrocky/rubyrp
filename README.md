# Rails React Bootstrap

Example application


## Main Dependencies

* Ruby [2.7.4](https://www.ruby-lang.org/en/downloads/releases/)
* Ruby on Rails [6.1.4.1](https://rubygems.org/gems/rails/versions)
* PostgreSQL [14.0](https://www.postgresql.org/support/versioning/)
* Redis [4.4.0](https://rubygems.org/gems/redis/versions)
* Webpacker [4.3.0](https://rubygems.org/gems/webpacker/versions)
* Stimulus [2.0.0](https://github.com/hotwired/stimulus/releases) (yarn)
* Hotwire [0.1.3](https://rubygems.org/gems/hotwire-rails/versions)
* Turbo [0.8.1](https://rubygems.org/gems/turbo-rails/versions) (yarn)
* React [17.0.2](https://reactjs.org/versions/) (yarn)
* Bootstrap [5.1.2](https://getbootstrap.com/docs/versions/) (yarn)
* If building from scratch (not cloning):
```
$ ruby -v
$ rails -v
$ rails new PROJECT_NAME -d=postgresql --webpacker=react
$ pg_config --version
$ npm view react version
```


## Other Dependencies

* Devise + Rolify + Cancan
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


## Analysis, Testing and Coverage

* PGHero: root/pghero (sysadmin)
* Brakeman + bundler_audit
```
$ brakeman
$ brakeman -o brakeman.html
$ open brakeman.html

$ bundle-audit
```
* Rspec + Simplecov
```
$ rspec
$ rspec spec/models/user_spec.rb

$ open coverage/index.html
```


## Initialization (Development)

* Search and replace in project:  rails_react_bootstrap , rails-react-bootstrap , RAILSREACTBOOTSTRAP
* config/example_application.yml -> config/application.yml (figaro and .gitignore already set)
* If you don't want to verify email, comment out :confirmable in user model and edit db/seeds
```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
$ bin/webpack-dev-server (separate tab)
```
* Reseting database
```
$ rails db:drop db:create db:migrate
$ rails db:seed
```

## Initialization (Heroku)

* Search and replace in project: rails_react_bootstrap , rails-react-bootstrap , RAILSREACTBOOTSTRAP
* The Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
* Buildpacks: heroku/nodejs | heroku/ruby
* Add-ons (free): Heroku Postgres | Heroku Redis | Heroku Scheduler | Rollbar | Papertrail
* example_application.yml -> personalize config vars in your heroku dashboard
* If you don't want to verify email, comment out :confirmable in the user model and edit db/seeds
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
