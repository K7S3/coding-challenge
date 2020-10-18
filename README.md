# README

This directory contains the Rails app for the absence manager.

## Features
1. Download the ical file for the absences of all employees by going to \
[localhost:3000/](localhost:3000/).
2. Download the ical file for the absences of particular employee given the userId. \
[http://localhost:3000/?userId=644](http://localhost:3000/?userId=644)
3. Download the ical file for the absences of employees given the start and end dates. \
[http://localhost:3000/?startDate=2017-01-01&endDate=2017-02-01](http://localhost:3000/?startDate=2017-01-01&endDate=2017-02-01)
4. Download the ics(ical version default) or vcs(Outlook version) file given the format. \
[localhost:3000/?format=vcs](localhost:3000/)

## Prerequisites

1. Install Ruby 
2. ``` gem install bundler ```
3. ``` bundle install ```

## Run Rails App
1. ``` rails s ```
2. Write Url Queries
3. Download ical file

## Running Specs
1. ``` bundle exec spec ``` or ``` bundle guard spec ```
