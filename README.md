# joomla-dev-docker
A simple structure for fast develop environment setup

## How to setup the environment:

Just clone this respository

$ git clone https://github.com/fabriciocotag/joomla-dev-docker

Switch to project folder

$ cd joomla-dev-docker

Run build command

$ make build

Copy the sql file to the database folder with the name database.sql and copy the Joomla files to the app directory

Set the database variables in the configuration.php

Now you can just type:

$ make start

And to upload the database file to the mysql container:

$ make upload-database

Now the project will be started sucessfully.

Note: The database is not persistent, and need be uploaded again after restart the containers

## Issues

To fix the "duplicate entry" issue, just type:

$ make fix-duplicates

And the database file will be fixed.
