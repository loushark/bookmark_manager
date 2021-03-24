# bookmark_manager

As a user
So that I can choose a website
I would like to see a list of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager


| class     | instances | methods                |
|-----------|-----------|------------------------|
| user      | @username |                        |
| bookmarks | @website  | list                   |
|           |           | add(address, title)    |



### To set up the database
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

# Setting up test database

Connect to psql
Create the database using the psql command
CREATE DATABASE bookmark_manager_test;
Connect to the database using the pqsl command
\c bookmark_manager_test;
Run the query we have saved in the file 01_create_bookmarks_table.sql

**Using TablePlus as GUI to manage databases**

## Current project status

- RSpec tests all passing
- Using test database to clear and populate bookmarks test table
- Database showing as an array on /bookmarks page
- Took out user for database so it works across different computers
- Shout out to Joe Pasquale

- Next challenge is number 10 - Creating bookmarks
