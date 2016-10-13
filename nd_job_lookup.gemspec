$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nd_job_lookup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nd_job_lookup"
  s.version     = NdJobLookup::VERSION
  s.authors     = ["Kingdon Barrett"]
  s.email       = ["kbarret8@nd.edu"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of NdJobLookup."
  s.description = "TODO: Description of NdJobLookup."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "sqlite3"
end
