# CSE 5335 #Project 2

1. What is your external data source used to populate your Heroku data sources.
   > Ans. For poplulating the Heroku data sources I used OMDB Api, used the JSON to parse the data and save it in the data sources, and used the title as a primary key to fetch the data.

2. What are the Heroku toolbelt commands to execute the scripts?
    >Ans.First we update the git hub source, after that we run heroku run bash, to get inside the code and then run the ruby code, using the command ruby filename.rb. So commands are: For github 
        1. git add . 
        2. git commit -m "comment"
        3. git push heroku master
        4. Heroku run bash
        5. ruby filename.rb

3. What aspect of the implementation did you find easy if any and why?
    >Ans. Postgre part was easy to implement because it was SQL, the connection and code was done earlier so not that much hard to implement.

4. What aspect of the implementation did you find hard if any and why?
    >Ans. The connection of MongoDB and Redis was quite hard and implementation of redis was also quite hard since it's a new database to implement we faced some err
### Version



