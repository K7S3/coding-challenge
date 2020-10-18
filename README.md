# Abstract

- I have implemented the backend(ruby) part of the coding challenge.
- I have also built a rails app for the 3 bonus acceptance criteria. 
- The backend code along with the tests can be found in the ```ruby_edition``` directory. To run the tests type ```bundle exec rspec```
- The rails app can be found in the ```rails-app``` directory. Inside the directory, run the server using ```rails s``` and run the tests using ```bundle exec rspec```.
- Only the last bonus feature (of doing it in js)has not been implemnted.
- I have also implemented one extra feature:- Downloading the file in either vcs or ics format.

 ## Features of Rails app

1. Download the ical file for the absences of all employees by going to \
[localhost:3000/](localhost:3000/).
2. Download the ical file for the absences of the particular employee given the userId. \
[http://localhost:3000/?userId=644](http://localhost:3000/?userId=644)
3. Download the ical file for the absences of employees given the start and end dates. \
[http://localhost:3000/?startDate=2017-01-01&endDate=2017-02-01](http://localhost:3000/?startDate=2017-01-01&endDate=2017-02-01)
4. Download the ics(ical version default) or vcs(Outlook version) file given the format. \
[localhost:3000/?format=vcs](localhost:3000/)


## Acceptance Criteria

- I can get a list of absences including the names of the employee (using api.js or api.rb)
- I can generate an iCal file and import it into outlook (maybe use a gem or npm package)
- I can see vacations of my employees as "#{member.name} is on vacation" 
- I can see sickness of my employees as "#{member.name} is sick" 
- (Bonus) I can go to http://localhost:3000 and download the iCal file
- (Bonus) I can go to http://localhost:3000?userId=123 and only receive the absences of the given user
- (Bonus) I can go to http://localhost:3000?startDate=2017-01-01&endDate=2017-02-01 and only receive the absences in the given date range
- (Bonus) Build the first 4 acceptance criteria in the other language (for backend candidates in js and for frontend candidates in ruby)
