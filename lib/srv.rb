require 'rack'

module Srv
  class Server
    def initialize(args)
      port = args[0] || 4000
      puts ">>> srv will run on port: #{port}"
      root = Dir.pwd
      puts ">>> serving contents of directory: #{root}"

      @rack_server = Rack::Server.new(:app => Rack::Directory.new(root),
                                      :Port => port,
                                      :AccessLog => [])
    end

    def run!
      @rack_server.start
    end
  end
end
