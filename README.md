# Rails React Bootstrap

Rails React Bootstrap example app


## Ruby version

2.7.2

## System dependencies

* Ruby on Rails 6.0.3.4
* PostgreSQL
* React
* rails new rails-react-bootstrap -d=postgresql --webpacker=react


## Database creation

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## Configuration

Install required gems.
```
$ bundle install
```

Configuration settings are set in these files:
* config/database.yml


## How to run the test suite

```
$ bundle exec rspec
or
$ bundle exec rake (coverage included)
```

$ open coverage/index.html (view coverage)


## Services

None at this time.


## TODO

```
1. Style todo list (mobile)
2. Blog WYSIWG
3. Tests
4. Heroku
```
