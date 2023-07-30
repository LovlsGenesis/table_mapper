module DatabasePlanner
  module RenderMigration
    class AddColumn

      attr_reader :table_name, :fields
      def initialize(table_name, fields)
        @table_name = table_name
        @fields = fields
      end

      def file_name
        "#{Time.now.to_fs(:number)}_add_columns_to_#{table_name.underscore}"
      end

      def content
        content = %{
class AddColumnsTo#{table_name.upcase} < ActiveRecord::Migration[7.0]
  def change
    #{fields_content}
  end
end
        }
      end

      def fields_content
        _fields_content = []
        @fields.each do |field| 
          _fields_content << "add_column :#{table_name}, :#{field[:name]}, :#{field[:type]}" 
        end
        _fields_content.join("\n")
      end


    end
  end
end
