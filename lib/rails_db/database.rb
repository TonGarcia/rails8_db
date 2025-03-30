module RailsDb
  class Database
    extend Connection

    class << self
      delegate :count,       to: :adapter
      delegate :truncate,    to: :adapter
      delegate :delete,      to: :adapter
      delegate :execute,     to: :adapter
      delegate :select,      to: :adapter
      delegate :explain,     to: :adapter
      delegate :exec_query,  to: :adapter
      delegate :primary_key, to: :adapter
      delegate :indexes,     to: :adapter
    end

    def self.tables
      puts '8. Starting tables method'
      begin
        result = connection.tables.sort - ['schema_migrations']
        puts "9. tables result: #{result.inspect}"
        result
      rescue => e
        puts "10. Error in tables: #{e.message}"
        puts e.backtrace
        raise
      end
    end

    def self.accessible_tables
      puts '11. Starting accessible_tables method'
      begin
        tables = Database.tables
        if Array.wrap(RailsDb.white_list_tables) != []
          tables = tables & RailsDb.white_list_tables
        end
        if Array.wrap(RailsDb.black_list_tables) != []
          tables = tables - RailsDb.black_list_tables
        end
        puts "12. accessible_tables result: #{tables.inspect}"
        tables
      rescue => e
        puts "13. Error in accessible_tables: #{e.message}"
        puts e.backtrace
        raise
      end
    end

    def self.adapter
      puts '14. Starting adapter method'
      begin
        result = case connection.class.to_s
        when /Mysql/
          RailsDb::Adapters::Mysql
        when /Postgre/
          RailsDb::Adapters::Postgres
        when /SQLite/
          RailsDb::Adapters::Sqlite
        else
          RailsDb::Adapters::BaseAdapter
        end
        puts "15. adapter result: #{result}"
        result
      rescue => e
        puts "16. Error in adapter: #{e.message}"
        puts e.backtrace
        raise
      end
    end

  end
end