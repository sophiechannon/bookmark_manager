# Bookmark Manager

**User Stories**

As a user,
So I can remember which websites I want to visit in the future,
I'd like to see a list of websites that I have saved.

As a curious user,
So I can save a website I've visited for later,
I'd like to be able to add websites to the list.

![Landing page](./docs/domain_model_bookmark.png?raw=true "Domain Model")

**Production database**

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

**Test database**

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql