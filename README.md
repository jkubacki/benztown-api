# README

This is admin and API part of Benztown app - https://github.com/jkubacki/benztown

## Prerequisites
You will need the following things properly installed on your computer:

For rails app:
 * ruby (via rvm, use proper [version](.ruby-version)) - https://rvm.io/ `rvm install ruby-2.6.1` `rvm use 2.6.1 --default`
 * postgres https://postgresapp.com/ or `brew install postgresql`

For search:
 * elasticsearch `brew install elasticsearch`

## Installation & running

* `gem install bundler` - install package manager for ruby
* `touch config/secrets.yml.key` and paste into it the encryption key located in Jaacoo vault as `Secrets encryption key`
* `bundle install` - install all ruby gems
* `rake db:create db:setup` - create database, insert tables, add simple data
* `rails s`
* http://localhost:3000

## Tests
`rspec`

## Features

By default seeds will create default mplc user from development credentials.
You can see it by `rails env_credentials:show -e development`

In admin panel there are two sections

Elements (with name and tags)
* upload
* index with preview
* search (by name and tags)
* edit
* delete

Clients
* create - this invites client to the application via email (it opens in browser via letter_opener in development)
* index with information whether user accepted the invitation
* search (by email)
* delete
