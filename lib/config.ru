root=Dir.pwd
puts ">>> serving contents of directory: #{root}"
run Rack::Directory.new("#{root}")
