# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jslib/version"

Gem::Specification.new do |s|
  s.name        = "jslib"
  s.version     = Jslib::VERSION
  s.authors     = ["Ben Marini"]
  s.email       = ["bmarini@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Less painful way to download js libs?}
  s.description = %q{Less painful way to download js libs?}

  s.rubyforge_project = "jslib"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "thor"
end
