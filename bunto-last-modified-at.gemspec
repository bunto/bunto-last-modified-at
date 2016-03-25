require File.expand_path('../lib/bunto-last-modified-at/version.rb', __FILE__)
Gem::Specification.new do |s|
  s.name                  = "bunto-last-modified-at"
  s.version               = Bunto::LastModifiedAt::VERSION
  s.summary               = "A liquid tag for Bunto to indicate the last time a file was modified."
  s.authors               = ["Garen J. Torikian", "Suriyaa Kudo"]
  s.homepage              = "https://github.com/gjtorikian/bunto-last-modified-at"
  s.license               = "MIT"
  s.files                 = Dir["lib/**/*.rb"]

  s.add_dependency "bunto"
  s.add_dependency "posix-spawn", "~> 0.3.9"
  s.add_development_dependency "rspec", "~> 2.13.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "spork"
end
