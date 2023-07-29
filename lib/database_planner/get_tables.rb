module DatabasePlanner
  class GetTables
    attr_reader :schema_hash
    def initialize()

    end

    def read_table
      # Get the database connection object
      connection = ActiveRecord::Base.connection

      # Get the names of all database tables
      tables = connection.tables

      # Build a hash to store the database structure
      @schema_hash ||= {}

      # Iterate over each table and retrieve its structure
      tables.each do |table_name|
        # Get the column information for the table
        columns = connection.columns(table_name)

        # Build a hash to store the column information
        table_columns = []

        columns.each do |column|
          # Store the column information as a hash
          column_info = {
            name: column.name,
            type: column.type,
            default: column.default,
            null: column.null
            # You can add other required column properties here
          }

          # Add the column information to the array of table columns
          table_columns << column_info
        end

        # Store the table structure information as a hash
        schema_hash[table_name.to_sym] = {
          name: table_name,
          columns: table_columns
        }
      end

      # Now, the schema_hasunlessh variable will contain the hash representation of the database structure
      puts "schema_hash!!"
      # puts schema_hash
      schema_hash.each do |table_name, table_hash|
        puts table_name
        puts table_hash
      end

      # Access the structure of a specific table
      users_table = schema_hash[:users]

      # Access the columns of the table
      columns = users_table[:columns]

      # Print the table name and column names
      puts "Table name: #{users_table[:name]}"
      columns.each do |column|
        puts "Column name: #{column[:name]}"
      end
    end


  end
end
