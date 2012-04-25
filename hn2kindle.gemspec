# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hn2kindle/version"

Gem::Specification.new do |s|
  s.name        = "hn2kindle"
  s.version     = Hn2kindle::VERSION
  s.authors     = ["simsicon"]
  s.email       = ["simsicon@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{hn2kindle}
  s.description = %q{Get Hackernews to Kindle Mobi}

  s.rubyforge_project = "hn2kindle"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
