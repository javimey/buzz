$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "buzz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "buzz"
  s.version     = Buzz::VERSION
  s.authors     = ["Javier Mey"]
  s.email       = ["javier.mey@gmail.com"]
  s.homepage    = ""
  s.summary     = "This gems allows you to connect with BuzzerBox."
  s.description = "This gems allows you to connect with BuzzerBox."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "rest-client"

  s.add_development_dependency "sqlite3"
end
