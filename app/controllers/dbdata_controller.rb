# All required gem
require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo

db = Mongo::Client.new(['ds033153.mongolab.com:33153'],:database => 'heroku_x36ms8zz', :user => 'root', :password => 'root')

#intializing all the vaiables
@totaldata=10
$count=100
$val=0
$quaote="'"
@param="tt0"
$number=120004
$i=0


while $val < $count  do
    $n=$number+$val
    $para="tt0#{$n}";
    puts $para
    #getting the data from json	
    data = JSON.parse(open("http://www.omdbapi.com/?i="+$para+"&plot=short&r=json").read) 
   insertintable = db[:heroku_x36ms8zz].insert_one({IMDBID: $para, Title: data['Title'], Released_Year: data["Year"].to_s, Movie_length: data["Runtime"], Genre: data["Genre"], Director: data["Director"], Language: data["Language"], Country: data["Country"]})
    	 
 puts data
$val=$val+1
end

puts "Enter the  ID:";
$name=gets
$name.delete!("\n")
documents=db[:heroku_x36ms8zz].find(:IMDBID => $name)

documents.each do |doc|	
  puts  doc.inspect

end

puts "Enter the year value:";
$name=gets
$name.delete!("\n")
documents=db[:heroku_x36ms8zz].find(:Released_Year => $name)

documents.each do |doc|	
  puts  doc.inspect

end


