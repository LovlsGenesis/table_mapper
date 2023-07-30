require_relative 'migration_file_templates'
# OUTSTANDING ISSUES
# * Rails cares what the migration files are named
#   * They can't have the same version number (time stamp)
#   * The name has to much the classname and the purpose of the migration e.g. "CreateUsers"

module DatabasePlanner
  class MigrationGenerator
    include MigrationFileTemplates

    def initialize
      puts "Migration generator initialized!"
    end

    def generate_migration_code(incoming_schema)

      # iterate over new schema (for each table_hash)
      incoming_schema.each do | table_hash |
        migration_code = ""

        if table_hash.include?(:action)
          if table_hash[:action].is_a?(Hash)
            # RENAME {:table=>"posts", :action=>{rename_table: "tweets"}
            template = rename_table(table_hash)
          else
            # CREATE {:table=>"comments", :action=>"create_table", :fields ... }
            # DROP {:table=>"post", :action=>"drop_table"}
            if table_hash[:action] == "create_table"
              template = create_table(table_hash)
            elsif table_hash[:action] == "drop_table"
              template = drop_table(table_hash)
            else
              puts "Something else I haven't thought of"
            end
          end
          migration_code << template
        end
        generate_migration_file(migration_code)
      end
    end

    def generate_migration_file(migration_code)
      puts "generating migration file!"

      migration_content = <<-RUBY
        class MigrationFromDatabasePlanner < ActiveRecord::Migration[7.0]
          def change
            #{migration_code}
          end
        end
      RUBY

      # Get the timestamp prefix for the migration file name
      timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")

      # Create random(ish) number so each migration file number is different (enough)
      migration_number = rand(100_000..999_999)

      # Define the migration file name
      migration_file_name = "#{timestamp}#{migration_number}.rb"

      # Define the target path to the Rails app's db/migrate folder
      target_path = File.expand_path("../../../../tm_test_app/db/migrate", __FILE__)

      # Create the migration file in the target path
      File.open(File.join(target_path, migration_file_name), "w") do |file|
        file.write(migration_content)
      end

    end
  end
end