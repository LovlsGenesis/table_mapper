module MigrationFileTemplates

  def create_table(data)
    table_name = data[:table]
    fields = ""
    data[:fields].each do |field|
      fields << "t.#{field[:type]} :#{field[:name]}\n"
    end

    create_table_template = <<-RUBY
      create_table :#{table_name} do |t|
        #{fields}
      end
    RUBY

  end

  def rename_table(data)
    "rename_table :#{data[:table]}, :#{data[:action][:rename_table]}"
  end

  def drop_table(data)
    "drop_table :#{data[:table]}"
  end
  
end