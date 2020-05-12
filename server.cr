require "flate"
require "gzip"
require "zlib"
require "kemal"
require "json"

SOCKETS = [] of HTTP::WebSocket

spawn do
  loop do
    SOCKETS.each { |socket| socket.send("ping") }
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
