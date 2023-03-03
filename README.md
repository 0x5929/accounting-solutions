# README

Requirements:

* Ruby: 3.2.0

* Rails: 7.0.4.2

* Database: PostgreSQL 14.6

* Redis: 4.0.6

* System: Linux 5.19.0-32, Ubuntu 22.04 (optional)


---

## To Get Started


### Install Requirements

- Highly recommend Mac or Linux, as Windows user will run into bundler, rails and ruby versioning and compatibility issues
- [Installing ruby 3.2](https://www.ruby-lang.org/en/documentation/installation/)
- [Installing Rails 7.0.4](https://guides.rubyonrails.org/v5.1/getting_started.html#installing-rails) 
- [Installing Redis 4.0.6](https://redis.io/docs/getting-started/installation/)
- [Installing PostgreSQL 14.6](https://www.postgresql.org/docs/current/tutorial-install.html)
- `$ git clone <repo>`

### Install Dependencies
- `$ cd <repo-dir>`
- `$ bundle install`

### Additional Setup
- RoR will expect you to have a PostgreSQL user and database name the same as `${whoami}`
- edit database file: `PROJECT_ROOT/config/database.yml`, enter credentials for database
- while editting this file, you may enter any environment variables in the system or relative to project
  - env variables such as database credentials, etc..
- `$ rake db:drop && rake db:prepare` to create fresh database
- if in production environment, do the following: `$ rails console`


```Ruby

AdminUser.create(
  id: 1, 
  email: 'root@localhost', 
  password: 'password', 
  created_at: DateTime.now, updated_at: DateTime.now)

User.create(
  id: 1, 
  email: 'user@localhost', 
  password: 'password', 
  created_at: DateTime.now, updated_at: DateTime.now)

dk = Doorkeeper::Application.all.first

# both output values below should to be in a .env file for frontend codebase
dk.uuid # REST API client_id
dk.secret # REST API client_secret

```

### To develop

- `$ rail serve` OR `$ bin/dev`
  - the latter will watch and recompile assets within the asset piplines
  - makes it much easier to have hot reload while dev

### To test

- `$ rails test; rails test:system`


---

### TODOs:
- add system E2E testing
- change template to client requirements 
- implement and integrate Google Drive API
- Static pages : 
  - back to top button?
  - light/dark mode themes
- And some more that I can't think of right now :)