# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nashville/version"

Gem::Specification.new do |s|
  s.name        = "nashville"
  s.authors     = ["Mattt Thompson"]
  s.email       = "m@mattt.me"
  s.license     = "MIT"
  s.homepage    = "http://github.com/nomad/nashville"
  s.version     = Nashville::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "iTunes Store API Client"
  s.description = ""

  s.add_dependency "json"
  s.add_dependency "commander", "~> 4.1"
  s.add_dependency "terminal-table", "~> 1.4"
  s.add_dependency "rash"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "simplecov"

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
