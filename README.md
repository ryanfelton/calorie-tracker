## README

### Development Requirements

* Ruby 2.2.3
* Node.js 5.0.0
* PostgreSQL 9.4.4

#### Setup

Open terminal and type the following code to setup your database and seed data

    > bin/setup

#### Server

Start the server by running the following command

    > bin/rails s

#### Visit the website

  Open the browser to http://localhost:3000

#### Seed Data

You can log in as 2 types of users. A regular user and an admin user that can see all meals.

Regular User
 * email: user@example.org
 * password: password

Admin User
  * email: admin@example.org
  * password: password

#### API

* User
    curl -s \
    -H "Authorization: Token token=1777e161a7a07d79e18ba0fc0311e904" \
    -H "Content-Type: application/json" \
    http://localhost:3000/api/meals

* Admin
    curl -s \
    -H "Authorization: Token token=1d08c99f401876cc29a6880d400f7750" \
    -H "Content-Type: application/json" \
    http://localhost:3000/api/meals

#### Testing

To run all of the tests you'll run rspec from the command line:

    > bin/rspec

Or if you wish to have the specs run automatically when the the file is changed, this app uses Guard to monitor files for changes and automatically run the specs.

    > bundle exec guard
