# README

This is admin and API part of Benztown app - audio elements manager for music​ ​production library company.

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

## Info & Disclaimers

I decided to add extra feature of inviting clients, sending invitation email and confirming account on the frontend.
It's out of MVP. Wouldn't implement it if I had a fixed time budget. But it nicely shows the way I write my services.

I intentionally included encryption keys for development and tests so I don't have to share them with you.
There are no sensitive data inside. If there were (e.g. development api secret key) I wouldn't share it.

It would be nice to have pagination on the backend and frontend. But that's another out of MVP feature.

In production setting I would setup a proxy from frontend to pass requests to the backend for admin panel
