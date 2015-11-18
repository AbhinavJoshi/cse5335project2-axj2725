require 'redis'
require 'json' 
require 'open-uri' 

redis = Redis.new(url: ENV["REDIS_URL"])

#Test Value to check the connection
redis.set("mykey", "hello world")
value = redis.get("mykey")
puts value

@totaldata=100
$count=100
$val=0
$quaote="'"
@param="tt0"
$number=120004
$i=0


while $val < $count  do
    $n=$number+$val
    $para="tt0#{$n}";
     
    data = JSON.parse(open("http://www.omdbapi.com/?i="+$para+"&plot=short&r=json").read) 

puts data["Title"]
redis.hset "row#{$i}","index",$val 
redis.hset "row#{$i}","IMDBID",$para 
redis.hset "row#{$i}","Title", data["Title"] 
redis.hset "row#{$i}","Year",data["Year"].to_s 
redis.hset "row#{$i}","Movie_length",data["Movie_length"].to_s 
redis.hset "row#{$i}","Genre",data["Genre"].to_s 
redis.hset "row#{$i}","Director",data["Director"].to_s 
redis.hset "row#{$i}","Language",data["Language"].to_s 
redis.hset "row#{$i}","Director",data["Director"].to_s 

$val=$val+1
end

puts "values stored to Redis database successfully" 

$index=gets.chomp
puts $index
puts redis.hgetall "row#{$index}"


