$:.push File.expand_path("../lib", __FILE__)

require "rails_db/version"

Gem::Specification.new do |s|
  s.name        = "rails8_db"
  s.version     = RailsDb::VERSION
  s.authors     = ["Ilton Silveira"]
  s.email       = ["iltonsilveira91@gmail.com"]
  s.homepage    = "https://github.com/TonGarcia/rails8_db"
  s.summary     = "Inspect your Rails DB (table content viewer, execute sql queries, export & import data"
  s.description = "Quick way to inspect your Rails database, see content of tables, filter, export them to CSV, Excel, EXPLAIN SQL and run SQL queries."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib,test}/**/*", "rails_db.gemspec", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.rdoc", "bin/rails_db", "bin/railsdb", "bin/runsql"] + Dir.glob("test/dummy/public/assets/**/*")
  s.test_files = Dir["test/**/*"]

  s.executables   = ["railsdb", "rails_db", 'runsql']

  s.add_dependency 'rails', ">= 8.0.2"
  s.add_dependency 'terminal-table', '~> 4.0'
  s.add_dependency 'simple_form', '>= 5.3.1'
  s.add_dependency 'activerecord', ">= 8.0.2"
  s.add_dependency 'ransack', '>= 4.3.0'
  s.add_dependency 'kaminari', '>= 1.2.2'
  s.add_dependency 'csv', '>= 3.3.3'
  s.add_dependency 'propshaft', '~> 1.1'

  s.add_development_dependency "launchy", '>= 3.1.1'
  s.add_development_dependency "sqlite3", '~> 1.7.3'
  s.add_development_dependency "mysql2", '>= 0.5.6'
  s.add_development_dependency "pg", '>= 1.5.9'
  s.add_development_dependency "caxlsx_rails", '>= 0.6.4'
  s.add_development_dependency 'will_paginate', '>= 4.0.1'
  s.add_development_dependency 'mime-types', '>= 3.6.2'
  s.add_development_dependency 'paranoia', '>= 3.6.2'
  s.add_development_dependency 'pry-rails', '>= 0.3.11'
  s.add_development_dependency 'puma', '>= 6.6.0'

  # Removed sprockets-rails
  # s.add_development_dependency 'sprockets-rails'

  # s.add_development_dependency 'populator'
  # s.add_development_dependency 'faker'
  # s.add_development_dependency 'pry'
end