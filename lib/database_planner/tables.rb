require 'database_planner/table'

module DatabasePlanner
  class Tables

    attr_reader :tables
    def initialize()
      read_table = DatabasePlanner::ReadTable.new(DatabasePlanner::Config.schema_file)
      @tables = read_table.read_file.map{ |table| Table.new(table) }

      @schema_version = read_table.schema_version
    end




  end
end
