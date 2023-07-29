module DatabasePlanner
  class MigrationGenerator

    def initialize(incoming_schema)
      @incoming_schema = [
        {:table=>"posts", :fields=>[{:type=>"string", :name=>"title"}, {:type=>"text", :name=>"body"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}, 
        {:table=>"users", :fields=>[{:type=>"string", :name=>"username"}, {:type=>"string", :name=>"email"}, {:type=>"string", :name=>"password"},{:type=>"integer", :name=>"age"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}
      ]
    end

    # get current schema file, convert to array of objects
    def get_current_schema
      @current_schema = [
        {:table=>"posts", :fields=>[{:type=>"string", :name=>"title"}, {:type=>"text", :name=>"body"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}, 
        {:table=>"users", :fields=>[{:type=>"string", :name=>"username"}, {:type=>"string", :name=>"email"}, {:type=>"string", :name=>"password"},{:type=>"integer", :name=>"age"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]},
        {:table=>"comments", :fields=>[{:type=>"string", :name=>"body"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}
      ]
    end

    # compare current schema file to incoming schema file
    # what if there is no old schema? what if the new schema is empty?
    # How would we know if a table name got changed?
    def get_schema_difference(old_schema, new_schema)
      change_table = []

      old_schema_tables = old_schema.map { |table_hash| table_hash[:table] }
      new_schema_tables = new_schema.map { |table_hash| table_hash[:table] }
      tables_to_drop = old_schema_tables - new_schema_tables

      # iterate over new schema (for each table_hash)
      new_schema.each do | table_hash |
        # if this table name exist in s0?
        if table_hash[:table] in old_schema_tables
          # iterate over hashes in fields array
          old_table = old_schema.find { |table| table[:table] == table_hash[:table] } # {:table=>"posts", :fields=>[{:type=>"string", :name=>"title"}, {:type=>"text", :name=>"body"}]}
          table_hash[:fields].each do | field | # {:type=>"string", :name=>"title"}
            # if name exists in corresponding s0 table hash
            if # oh no, I'm running into an algorithmic issue
            
              # if type is not the same
                # update type
            # name doesn't exist (field is new)
              # create new field hash and add to fields array
          end
        # else
          # create this table in new migration (create a table hash)
          # {:table=>"tablename", :fields=>[{},{}]}
        end
      end

    end

    # create an array of hashes that describe the differences between s0 and s1
    # use this array to generate a rails migration file
    # prompt user to verify and use db:migrate
    def generate_migration_file
      s0 = @current_schema
      s1 = [{:table=>"posts", :fields=>[{:type=>"string", :name=>"title"}, {:type=>"text", :name=>"body"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}]
      schema_difference = get_schema_difference(s0,s1)
      puts schema_difference
    end


  end
end