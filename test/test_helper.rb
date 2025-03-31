# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

puts "TRYING TO USE DB: #{ENV['DB'] || 'default'}"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

# Ensure assets are precompiled for tests
Rails.application.config.assets.compile = true
Rails.application.config.assets.digest = false

Debuggers.print "Gemspec Files:"
spec = Gem::Specification.load("#{`pwd`.chomp}/rails_db.gemspec")
Debuggers.print "spec.files.inspect: #{spec.files.inspect}"

Debuggers.print "Before initializers:"
Debuggers.print "autoload_paths: #{Rails.application.config.autoload_paths}"
Debuggers.print "eager_load_paths: #{Rails.application.config.eager_load_paths}"

require Rails.root.join('config', 'initializers', 'assets.rb')

Debuggers.print "After assets.rb:"
Debuggers.print "autoload_paths: #{Rails.application.config.autoload_paths}"
Debuggers.print "eager_load_paths: #{Rails.application.config.eager_load_paths}"

Debuggers.print "USING DB: #{RailsDb::Database.adapter.adapter_name}"
Debuggers.print "USING Rails: #{Gem.loaded_specs['rails'].version}"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }