module RailsDb
  class DashboardController < RailsDb::ApplicationController

    def index
      puts '1. Starting index action'
      begin
        puts '2. Before render'
        render
        puts '3. After render'
      rescue => e
        puts "4. Error in index: #{e.message}"
        puts e.backtrace
        raise
      end
    end

  end
end
