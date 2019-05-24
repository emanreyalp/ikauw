# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Requirements
- Ruby 2.6.0
- Postgresql

## Read the API's documentation [here](API.md)

## How to start
- Go to the project folder
- For installing the dependencies and preparing the database, run:
```
setup
```
It will delete the database if that's exist.

- Run the test suit with:
```
bundle exec rspec
```
- If everything is fine, run the server:
```
rails s
```

## Fill database with fake data
If you wanted to fill your database with fake data, run the following rake command:
```
rake db:faker
```
It will create users, movies, seasons with episodes, purchase options and purchases.
