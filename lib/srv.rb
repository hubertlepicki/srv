require 'rack'

module Srv
  class Server
    def initialize(args)
      port = args[0] || 4000
      puts ">>> srv will run on port: #{port}"
      root = Dir.pwd
      puts ">>> serving contents of directory: #{root}"

      @rack_server = Rack::Server.new(:app => DirectoryWithIndex.new(root),
                                      :Port => port,
                                      :AccessLog => [])
    end

    def run!
      @rack_server.start
    end
  end

  class DirectoryWithIndex < Rack::Directory
    def list_directory
      index, = Dir.glob(File.join(@path, "index.htm*"))
      if index
        index_path_info = @path_info
        index_path_info += "/" unless @path_info[-1] == "/"
        index_path_info += File.basename index
        altered_env = @env.dup
        altered_env["PATH_INFO"] = index_path_info
        @app.call(altered_env)
      else
        super
      end
    end
  end
end
