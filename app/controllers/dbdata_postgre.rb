require 'json'
require 'open-uri'
require 'rubygems'
require 'pg'

@totaldata=100
$count=100
$val=0
$quaote="'"
@param="tt0"
$number=120004
$i=0

db = PGconn.open(:host=>'ec2-54-204-30-115.compute-1.amazonaws.com', 
:dbname => 'd47r6ajav9q99j', 
:user=> 'xlsbxxttskbqbg', 
:password=>'Jf_LVFngd506BdqW50EiLBNN7J')
db.exec "CREATE TABLE IF NOT EXISTS MovieDATA3(Id INTEGER PRIMARY KEY,ImdbId TEXT,MovieName TEXT,Year TEXT,Rating TEXT,Runtime TEXT,Genre TEXT)"
db.exec "DELETE from MovieDATA3"

while $val < $count  do

$n=$number+$val
$para=@param + "#{$n}"
result = JSON.parse(open("http://www.omdbapi.com/?i="+ $para +"&plot=short&r=json").read) 
   if result['Title'].nil? 

   else
   	
           $imdbid=$quaote + $para + $quaote
           $moviename=$quaote + result['Title'].gsub(/[^[:word:]\s]/, '') + $quaote
	   $year=$quaote + result['Year'].tr('^A-Za-z0-9','') + $quaote
           $rating=$quaote + result['Rated'].tr('^A-Za-z0-9','') + $quaote
           $runtime=$quaote + result['Runtime'].tr('^A-Za-z0-9','') + $quaote
           $genre=$quaote + result['Genre'].tr('^A-Za-z0-9','') + $quaote
           db.exec "INSERT INTO MovieDATA3 VALUES(#{$val},#{$imdbid},#{$moviename},#{$year},#{$rating},#{$runtime},#{$genre})"
    end  
        $val=$val+1
   
    
 end

#Getting Input from USER for primary index
puts "Insert a ID"
ValueUser = gets
#stm2 = db.prepare "SELECT ID FROM MovieTable where Id=?" 
$rs2 = db.exec "SELECT Year,Rated FROM MovieDATA3 where Id="+ValueUser

my_results = {}


$rs2.each do |row|
 puts "Data is"
 
 puts row
 # my_results["MovieName"] = row['MovieName']
 # my_results["Year"] = row['Year']
end


#Getting Input from USER

$rs3 = db.exec "SELECT * FROM MovieDATA3 where Year='1997'"

$rs3.each do |row1|
 puts "Data is"
 puts row1
 
end
