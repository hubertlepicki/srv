# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "srv/version"

Gem::Specification.new do |s|
  s.name        = "srv"
  s.version     = Srv::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Hubert Lepicki"]
  s.email       = ["hubert.lepicki@gmail.com", "hubert.lepicki@amberbit.com"]
  s.homepage    = ""
  s.summary     = %q{static files server}
  s.description = %q{fire up with 'srv' to serve current directory on port 4000 (default), 'srv 5000' on port 5000}

  s.rubyforge_project = "srv"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'rack', '2.0.1'
end
