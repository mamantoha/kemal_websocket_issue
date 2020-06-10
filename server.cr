require "kemal"
require "json"

SOCKETS = [] of HTTP::WebSocket

spawn do
  loop do
    puts "ping"
    SOCKETS.each do |socket|
      begin
        socket.send("ping")
      rescue
        nil
      end
    end
    sleep 1
  end
end

get "/" do
  render "views/index.ecr"
end

ws "/" do |socket|
  SOCKETS << socket
end

Kemal.run
