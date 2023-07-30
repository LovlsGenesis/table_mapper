require 'database_planner/render_migration/create_table'
require 'database_planner/render_migration/add_column'

module DatabasePlanner
  module RenderMigration

    def self.create(action, table_name, fields)
      unless ["create_table", "add_column", "remove_column"].any?(action)
        raise "This action: #{action} is not allow to render migration." 
      end

      self.send(action, table_name, fields) 
    end

    def self.create_table(table_name, fields)
      table = CreateTable.new(table_name, fields)
      File.open(table.file_name, "w") {|f| f.write(table.content) }
      table
    end

    def self.add_column
      table = AddColumn.new(table_name, fields)
      File.open(table.file_name, "w") {|f| f.write(table.content) }
      table
    end


  end
end
