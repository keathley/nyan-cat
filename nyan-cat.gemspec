Gem::Specification.new do |s|
  s.name        = 'nyan-cat'
  s.version     = '0.0.0'
  s.executables << 'nyan-cat'
  s.date        = '2013-12-17'
  s.summary     = "Command line cat"
  s.description = "Nyan Cat all of the things"
  s.authors     = ["Chris Keathley"]
  s.email       = 'spyc3r@gmail.com'
  s.files       = [
    "lib/nyan_cat.rb",
    "lib/nyan-cat/cat.rb",
    "lib/nyan-cat/ui.rb"
  ]
  s.homepage    = 'https://github.com/spyc3r/nyan-cat'
  s.license     = 'MIT'
end
