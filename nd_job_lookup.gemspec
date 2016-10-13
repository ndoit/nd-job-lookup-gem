$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nd_job_lookup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nd_job_lookup"
  s.version     = NdJobLookup::VERSION
  s.authors     = ["Kingdon Barrett"]
  s.email       = ["kbarret8@nd.edu"]
  s.homepage    = "https://bitbucket.com/nd-oit/nd-job-lookup-gem"
  s.summary     = "Lookup ND jobs by employee"
  s.description = "Rails Engine plugin to interoperate with nd_employee_lookup gem"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.7.1"
  #s.add_dependency "nd_employee_lookup", "~> 0.0.2"
  s.add_dependency "jquery-rails", "~> 4.2.1"
  s.add_dependency "foundation-rails", "~> 5.4.3.0"

  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'rspec-rails', '~> 3.5.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'webmock', '~> 2.1.0'
  s.add_development_dependency 'sqlite3', '~> 1.3.11'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1.1'
  s.add_development_dependency 'sinatra', '~> 1.4.7'
  s.add_development_dependency 'capybara', '~> 2.7.1'
  # s.add_development_dependency 'selenium-webdriver', '~> 2.53.4'
  # s.add_development_dependency 'capybara-webkit', '~> 1.11.1'
  s.add_development_dependency 'database_cleaner'
end
