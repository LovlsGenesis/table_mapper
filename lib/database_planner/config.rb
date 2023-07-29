module DatabasePlanner
  class Config
    def self.schema_file
      @filename = File.join(Rails.root, 'db', 'schema.rb')

      raise 'File not Found' unless File.exist?(@filename)

      @filename
    end
  end
end
