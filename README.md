# Rails React Bootstrap

Example application


## System dependencies

* Ruby 2.7.2
* Ruby on Rails 6.0.3.4
* PostgreSQL
* React
```
$ ruby -v
$ rails -v
$ rails new PROJECT_NAME -d=postgresql --webpacker=react
```


## Initialization

```
$ bundle install
$ yarn install
$ rails db:create
$ rails db:seed
$ rails s
```


## Authentication

* devise
* rolify
* cancancan


## Frameworks, Libraries, Packages and Gems

* Bootstrap
* Font Awesome
* jQuery
* chart js
* chartkick + groupdate
* will_paginate
* Action Text (trix)


## Testing (rspec)

```
$ bundle exec rspec
$ open coverage/index.html
```


## Services

```
None at this time.
```


## Itinerary

```
1. Terms / privacy / sitemap
2. Admins scaffold (sanitize in application controller)
3. Users + Devise API
4. Tests (Users API + Todo API)
5. Heroku
```
