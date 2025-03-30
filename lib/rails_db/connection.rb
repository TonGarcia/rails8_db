module RailsDb
  module Connection

    def connection
      puts '17. Starting connection method'
      begin
        result = ActiveRecord::Base.connection
        puts "18. connection result: #{result}"
        result
      rescue ActiveRecord::ConnectionNotEstablished => e
        puts "19. Connection not established, trying to establish connection"
        begin
          result = ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env]).connection
          puts "20. New connection established: #{result}"
          result
        rescue => e
          puts "21. Error establishing connection: #{e.message}"
          puts e.backtrace
          raise
        end
      rescue => e
        puts "22. Error in connection: #{e.message}"
        puts e.backtrace
        raise
      end
    end

    def columns
      puts '23. Starting columns method'
      begin
        result = connection.columns(name)
        puts "24. columns result: #{result.inspect}"
        result
      rescue => e
        puts "25. Error in columns: #{e.message}"
        puts e.backtrace
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
      puts '26. Starting column_names method'
      begin
        result = columns.collect(&:name)
        puts "27. column_names result: #{result.inspect}"
        result
      rescue => e
        puts "28. Error in column_names: #{e.message}"
        puts e.backtrace
        raise
      end
    end

  end
end
