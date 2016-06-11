# README

Sample project that uses Ruby 2.3.0, Rails 5 and some of its features:

* Action cable
* Enum prefixes
* Actually, that's all:D

It has only 2 pages: `/` and `/admin`.
On root you can see dollar to ruble exchange rate.

In admin interface you can force value (by the way, background script
updates value automatically) on some time.

# Requirements

* Rails 5
* Sqlite
* Redis
* Foreman (it is in gemfile)

# Launching

1. Clone repo
2. `bundle install`
3. `rails db:schema:load` or `rails db:migrate`
4. `rails db:seed` - it is **important**!
5. `foreman start`
