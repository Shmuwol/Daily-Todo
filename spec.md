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
- [ ] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
