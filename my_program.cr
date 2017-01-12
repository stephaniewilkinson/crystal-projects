require "http/server"
require "http/client"
require "json"

class MyServer
  response_array = JSON.parse((HTTP::Client.get "https://pokeapi.co/api/v2/pokemon/3/").body)

  server = HTTP::Server.new(8080) do |context|
    context.response.content_type = "text/plain"
    context.response.print "Hello world! The time is #{Time.now}"
    response_array.each_with_index do |pokemon, i|
      context.response.puts "BULBASAUR FACTS"
      context.response.puts i
      context.response.puts pokemon
    end
  end

  puts "Listening on http://127.0.0.1:8080"
  server.listen
end
