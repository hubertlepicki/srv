require 'rack'

module Srv
  class Server
    def initialize(args)
      port = args[0] || 4000
      puts ">>> srv will run on port: #{port}"
      @rack_server = Rack::Server.new(:config => File.join(File.dirname(__FILE__), 'config.ru'),
                                      :Port => port,
                                      :AccessLog => [])
    end

    def run!
      @rack_server.start
    end
  end
end
