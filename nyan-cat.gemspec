$:.push File.expand_path("../lib", __FILE__)
require "nyan-cat/version"

Gem::Specification.new do |s|
  s.name        = 'nyan-cat'
  s.version     = NyanCat::VERSION
  s.executables << 'nyan-cat'
  s.date        = '2013-12-17'
  s.summary     = "Command line cat"
  s.description = "Nyan Cat all of the things"
  s.authors     = ["Chris Keathley"]
  s.email       = 'spyc3r@gmail.com'
  s.homepage    = 'https://github.com/spyc3r/nyan-cat'
  s.license     = 'MIT'

  s.add_dependency "paint", "~> 0.8.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
