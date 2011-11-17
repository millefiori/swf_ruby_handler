# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "swf_ruby_handler/version"

Gem::Specification.new do |s|
  s.name        = "swf_ruby_handler"
  s.version     = SwfRubyHandler::VERSION
  s.authors     = ["millefiori"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{replacing string in swf binary}
  s.description = %q{replacing string in swf binary}

  s.rubyforge_project = "swf_ruby_handler"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
