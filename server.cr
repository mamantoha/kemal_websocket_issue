require "kemal"
require "json"

SOCKETS = [] of HTTP::WebSocket

spawn do
  loop do
    puts "ping"
    SOCKETS.each do |socket|
      begin
        socket.send("ping")
      rescue e
        puts e.message
        nil
      end
    end
    sleep 5
  end
end

get "/" do
  render "views/index.ecr"
end

ws "/" do |socket|
  SOCKETS << socket
end

Kemal.run
