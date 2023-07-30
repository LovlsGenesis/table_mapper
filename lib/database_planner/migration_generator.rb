module DatabasePlanner
  class MigrationGenerator

    def initialize(incoming_schema)
      @incoming_schema = [
        {:table=>"posts", :fields=>[{:type=>"string", :name=>"title"}, {:type=>"text", :name=>"body"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}, 
        {:table=>"users", :fields=>[{:type=>"string", :name=>"username"}, {:type=>"string", :name=>"email"}, {:type=>"string", :name=>"password"},{:type=>"integer", :name=>"age"}, {:type=>"datetime", :name=>"created_at"}, {:type=>"datetime", :name=>"updated_at"}]}
      ]
    end

    def get_current_schema
      # use Read Table module to get current schema
    end

    def generate_migration_code(old_schema, new_schema)

      # iterate over new schema (for each table_hash)
      new_schema.each do | table_hash |
        puts table_hash
      end

    end

    def generate_migration_file

      migration_content = <<-RUBY
        class MyMigration < ActiveRecord::Migration[7.0]
          def change
            # Your migration code here
          end
        end
      RUBY

      # Get the timestamp prefix for the migration file name
      timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")

      # Define the migration file name
      migration_file_name = "#{timestamp}_my_migration.rb"

      # Define the target path to the Rails app's db/migrate folder
      target_path = File.expand_path("../../../../../db/migrate", __FILE__)

      # Create the migration file in the target path
      File.open(File.join(target_path, migration_file_name), "w") do |file|
        file.write(migration_content)
      end

    end


  end
end