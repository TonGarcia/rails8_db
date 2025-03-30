module RailsDb
  module Connection

    def connection
      Debuggers.print '17. Starting connection method'
      begin
        result = ActiveRecord::Base.connection
        Debuggers.print "18. connection result: #{result}"
        result
      rescue ActiveRecord::ConnectionNotEstablished => e
        Debuggers.print "19. Connection not established, trying to establish connection"
        begin
          result = ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env]).connection
          Debuggers.print "20. New connection established: #{result}"
          result
        rescue => e
          Debuggers.print "21. Error establishing connection: #{e.message}"
          Debuggers.print e.backtrace
          raise
        end
      rescue => e
        Debuggers.print "22. Error in connection: #{e.message}"
        Debuggers.print e.backtrace
        raise
      end
    end

    def columns
      Debuggers.print '23. Starting columns method'
      begin
        result = connection.columns(name)
        Debuggers.print "24. columns result: #{result.inspect}"
        result
      rescue => e
        Debuggers.print "25. Error in columns: #{e.message}"
        Debuggers.print e.backtrace
        raise
      end
    end

    def column_properties
      %w(name sql_type null limit precision scale type default)
    end

    def to_param
      name
    end

    def column_names
      Debuggers.print '26. Starting column_names method'
      begin
        result = columns.collect(&:name)
        Debuggers.print "27. column_names result: #{result.inspect}"
        result
      rescue => e
        Debuggers.print "28. Error in column_names: #{e.message}"
        Debuggers.print e.backtrace
        raise
      end
    end

  end
end
