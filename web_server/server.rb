require 'socket'       
require 'json'        

server = TCPServer.open(2000)  
loop {     
  Thread.start(server.accept) do |client|        

    request_message = client.read_nonblock(256)
    request, body = request_message.split("\r\n\r\n", 2)
    file = request.match(/(\w+\/)*\w+\.\w+/)[0]

    if File.exist? file
      f = File.open(file)
      if request =~ /^get/i
        client.puts "#{request.match(/HTTP\/\d\.\d/)[0]} 200 OK\n#{Time.now.ctime}" \
                    "\nContent-Length: #{file.size}\r\n\r\n#{f.read}"
      elsif request =~ /^post/i
        params = JSON.parse(body)
        li_s = ''
        params["viking"].each { |key, value| li_s += "<li>#{key.capitalize}: #{value}</li>" } 
        client.puts "#{request.match(/HTTP\/\d\.\d/)[0]} 200 OK\n#{Time.now.ctime}" \
                    "\nContent-Length: #{file.size}\r\n\r\n" \
                    "#{f.read.gsub("<%= yield %>", li_s)}"
      else
        client.puts "Unknown request type"
      end
    else
      client.puts "#{request.match(/HTTP\/\d\.\d/)[0]} 404 NOT FOUND\n#{Time.now.ctime}\r\n\r\n"
    end

    client.close      
  end           
}
