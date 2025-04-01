module RailsDb
  class DashboardController < RailsDb::ApplicationController

    def index
      Debuggers.print '1. Starting index action'
      begin
        Debuggers.print '2. Before render'
        render
        Debuggers.print '3. After render'
      rescue => e
        Debuggers.print "4. Error in index: #{e.message}"
        puts e.backtrace
        raise
      end
    end

  end
end
