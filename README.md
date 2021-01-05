# Rails React Bootstrap

Example application


## System Dependencies

* Ruby 2.7.2
* Ruby on Rails 6.0.3.4
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
* Chart.js
* Chartkick + Groupdate
* Action Text (trix)
* will_paginate
* Devise + Rolify + Cancan
* Figaro
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

```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
```


## Initialization (Heroku)

* The Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
* Add-ons: Rollbar | Papertrail | Heroku Postgres
* Buildpacks: heroku/nodejs | heroku/ruby
```
$ heroku git:remote -a your_app_name
$ git remote rename heroku production
$ git push production master
$ heroku run rake db:schema:load --app PROJECT_NAME
$ heroku run rake db:seed --app PROJECT_NAME
```
