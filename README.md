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
* Rspec


## Initialization

```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
```


## Testing (rspec)

```
$ rspec
$ open coverage/index.html
```


## Itinerary

```
1. Stripe (members)
2. Terms / privacy / sitemap(status)
3. CSV Reports
4. Heroku
```
