# Terrene Take-Home Assignment
Welcome to the Terrene Ruby on Rails take-home assignment!  Below are instructions to set up the application followed by assignments for changes to make.  It's designed to take about four hours.  Read through all of the assginments before starting.  Good luck!

# Set up
Make sure you have the correct version of ruby (2.7.2), bundler, and git installed first.

- `git init` to initialize a new git repository
- `git commit -am "Initial Commit"` to add all of the files 
- `bundle install` to install dependencies
- `bundle exec rake db:create` to create the database
- `bundle exec rake db:migrate` to add all tables
- `bundle exec rspec` to run the spec suite. If everything is set up correctly, all specs should pass

# Primary Assignments
Please complete the following assignments in the current repository. Please make at least one commit for each assignment, but you make make multiple commits for each.  You may use branches, but all solutions should be merged into master. When you are finished, zip this folder and return it via email.

- **make todo items routes shallow** - add the `shallow: true` option to the route for items.
- **add a show endpoint for the current user** - the show endpoint for the user should contain the user's name, email, id and timestamps, but not the user's password_hash
- **add pagination to the todo_items endpoint** - the list of items for a todo can be so large that it causes issues with rendering the endpoint.  add pagination to this endpoint with the [Kaminari](https://github.com/kaminari/kaminari) gem.

# Bonus Assignments
If you are able to complete the primary assignments with plenty of time left and you'd like to push farther.

- **upgrade to rails 6** - this application is currently on rails 5, update it to the latest version of rails.
- **version shallow items routes** - some clients might still be using the old version of the items routes. We can allow them to continue to use the old routes if we prefix it with `/v1/` and prefix the new routes with `/v2/`

