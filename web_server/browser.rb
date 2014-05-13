require 'socket' 
require 'json'       
 
host = 'localhost'    
port = 2000                         

puts "What's your request type? GET/POST"
request_type = gets.chomp.upcase
puts "What path are you looking for?"
path = gets.chomp.downcase

if request_type == "GET"
  request = "GET #{path} HTTP/1.0\r\n\r\n"  
elsif request_type == "POST"
  puts "What name a viking has?"
  name = gets.chomp
  puts "What's his email?"
  email = gets.chomp
  viking_hash = {:viking => {:name => name, :email => email}}
  content = viking_hash.to_json
  request = "POST #{path} HTTP/1.0\nContent-Length: #{content.size}\r\n\r\n#{content}"
end


socket = TCPSocket.open(host,port)  
socket.print(request)               
response = socket.read              

headers,body = response.split("\r\n\r\n", 2) 
print body         