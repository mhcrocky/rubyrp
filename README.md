# Rails React Bootstrap

Example application


## System Dependencies

* Ruby 2.7.2
* Ruby on Rails 6.1.3.2
* PostgreSQL
```
$ ruby -v
$ rails -v
$ rails new PROJECT_NAME -d=postgresql --webpacker=react
```


## Libraries, Packages and Gems

* Font Awesome
* Bootstrap
* jQuery
* React
* Stimulus
* Chart.js
* Chartkick + Groupdate
* Action Text (trix)
* will_paginate
* Devise + Rolify + Cancan
* Figaro
* Redis (production)
* Simplecov
* Rspec
* PGHero


## Monitoring, Testing and Coverage

* PGHero: root/pghero (sysadmin)
```
$ rspec
$ open coverage/index.html
```


## Initialization (Development)

* Set GMAIL_USERNAME, GMAIL_PASSWORD, TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN in /config/application.yml ( figaro | .gitignore ). If you don't want to use verification email, comment out :confirmable in user model and edit db/seeds
```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
```


## Initialization (Heroku)

* The Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
* Add-ons: Rollbar | Papertrail | Heroku Redis | Heroku Postgres
* Buildpacks: heroku/nodejs | heroku/ruby
* Set GMAIL_USERNAME, GMAIL_PASSWORD, TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN in Config Vars
```
$ heroku git:remote -a your_app_name
$ git remote rename heroku production
$ git push production master
$ heroku run rake db:schema:load --app PROJECT_NAME
$ heroku run rake db:seed --app PROJECT_NAME

$ heroku run rails c
$ heroku logs --tail
$ heroku restart
```
