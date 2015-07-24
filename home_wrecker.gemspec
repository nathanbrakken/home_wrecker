Gem::Specification.new do |s|
  s.name        = 'home_wrecker'
  s.version     = '0.0.5'
  s.date        = '2015-07-23'
  s.summary     = "Hola!"
  s.description = "A load testing gem that compares two sites using Siege"
  s.authors     = ["Nathan Brakken"]
  s.email       = "nathanbrakken@gmail.com"
  s.files       = ["lib/home_wrecker.rb"]
  s.require_paths = ["lib"]
  s.homepage    = "http://rubygems.org/gems/home_wrecker"
  s.license     = 'MIT'
  s.add_dependency 'thor',     '~> 0.19.1'
  s.executables << 'home_wrecker'
end