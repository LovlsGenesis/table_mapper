module DatabasePlanner
  module RenderMigration
    class CreateTable

      attr_reader :table_name, :fields
      def initialize(table_name, fields)
        @table_name = table_name
        @fields = fields
      end

      def file_name
        "#{Time.now.to_fs(:number)}_create_#{table_name.underscore}"
      end

      def content
        content = %{
class Create#{table_name.classify} < ActiveRecord::Migration[7.0]
  def change
    create_table :#{table_name} do |t|
      #{fields_content}
    end
  end
end
        }
      end

      private

      def fields_content
        _fields_content = []
        @fields.each do |field| 
          _fields_content << "t.#{field[:type]} #{field[:name]}" 
        end
        _fields_content.join("\n")
      end


    end
  end
end
