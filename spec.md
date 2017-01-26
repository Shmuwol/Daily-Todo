# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  * used Sinatra to create web routes as app controllers
- [x] Use ActiveRecord for storing information in a database
  * used active record to store info into sqlite database by inheriting models from ActiveRecord:Base
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  * created `list` and `list_items` models
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  * list `has_many` list items, list items `belongs_to` a list
- [x] Include user accounts
  * users can create new accounts, app validates if user is logged_in and redirects to /welcome if not
- [x] Ensure that users can't modify content created by other users
  * using the `current_user` helper method whenever a user tried to modify something
- [x] Include user input validations
  * using validates_presence_of for input
  * validates_format_of email using regex for email field
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  * using rack-flash
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
