# Rails Skeleton
A skeleton setup for a new Ruby on Rails project

### Versions of note
Ruby 2.3.3
Rails 5.0.1
PostgreSQL 9.6

### Included in this skeleton
* Vagrantfile for setting up and hosting a Postgres DB
* A `database.sample.yml` file as a template for connecting to the hosted DBs
* [Brakeman](https://github.com/presidentbeef/brakeman)
* [Rubocop](https://github.com/bbatsov/rubocop)
* [FactoryGirl](https://github.com/thoughtbot/factory_girl)
* [Capybara](https://github.com/teamcapybara/capybara)

### Rake tasks
This skeleton comes with the following rake tasks configured:
* `rake rubocop` - Runs Rubocop on the entire project 
* `rake rubocop:auto_correct` - Runs Rubocop autocorrect on the entire project
* `rake brakeman:check` - Uses Brakeman to report on security vulnerabilities