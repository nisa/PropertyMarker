# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.3.1

* Configuration

bundle install
foreman start

* Database setup

rails db:create
rails db:migrate
rails db:seed

* How to run the test suite

RAILS_ENV=test rails db:create
RAILS_ENV=test rails db:migrate
RAILS_ENV=test rails db:seed

rspec spec/
