$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails/eve/base/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails-eve-base"
  spec.version     = Rails::Eve::Base::VERSION
  spec.authors     = ["Adam Ladachowski"]
  spec.email       = ["adam@saiden.pl"]
  spec.homepage    = "https://github.com/aladac/rails-eve-base"
  spec.summary     = "Main runtime of EVE Online RoR plugins"
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_development_dependency "sqlite3"
end
