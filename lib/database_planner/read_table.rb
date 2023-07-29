module DatabasePlanner
  class ReadTable
    attr_accessor :filename, :tables, :schema_version

    def initialize(filename)
      @filename = filename
    end

    def read_file
      file = File.read(@filename)
      @tables = []

      @lines = file.split("\n").map(&:lstrip).reject { |line| line.first == '#' || line.empty? }

      @lines.each_with_index do |line, index|
        if line.start_with?('ActiveRecord::Schema')
          @schema_version = line.partition('version:').last.split(')').first.lstrip
        elsif line.start_with?('create_table')
          table_start_at_index = index
          name = line.gsub(/[^a-zA-Z_\s]/, '').split(' ')[1]
          table = map_table(name, table_start_at_index)
          @tables << table
        end
      end

      puts '*' * 50
      p @schema_version
      puts '*' * 50
      p @tables
      puts '*' * 50
    end

    def map_table(name, start)
      @fields = []
      @lines.each_with_index do |line, index|
        next unless index >= start
        next unless line.start_with?('t.')
        break if line == 'end'

        line = line.split(' ')
        @fields << {
          name: line[1].gsub(/[^a-zA-Z_]/, ''),
          type: line[0].gsub('t.', '')
        }
      end

      {
        table: name,
        fields: @fields
      }
    end
  end
end
