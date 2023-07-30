module DatabasePlanner
  class Table

    attr_reader :table, :table_name, :fields
    def initialize(table)
      @table = table
      @table_name = table[:table]
      @fields = table[:fields]
    end




  end
end
