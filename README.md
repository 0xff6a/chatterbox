Week 6 Challenge @ Makers Academy
=================================

Chatterbox - a twitter clone that will allow the users to post messages to a public stream. Hosted on Heroku @ http://fast-wave-2933.herokuapp.com/

Ruby Version
------------
Ruby 2.1.2

Technologies used:
------------------
- Sinatra
- Postgres SQL and Datamapper ORM
- Bcrypt
- Rspec and Capybara for testing

Features:
---------

 - To use chatterBOX fully users must sign in
 - Non registered users can view content but cannot contribute
 - Users must log in to post (Hoot), reply (Hoot 'em back), and see all threads they are active in (Hootenannies)
 - Users can log out at any time
 - Users can post a Hoot to chatterBOX
 - Hoots are arranged in chronological order of the first post. 
 - On the right hand side of a Hoot a user can see the number of Hoot 'em backs associated with the post and can add a new hoot 'em back'
 - Each user can access their Hootenannies page that shows them all Hoots they have been active in (either Hoots or Hoot 'em backs')
 - If a user forgets their password they can request for it to be reset through their registered email account

Running the application:
------------------------
$ rackup from root will open app on port 9292

Running the test suite:
-----------------------
$ rspec from root



