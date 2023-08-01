require 'database_planner/read_table'
require 'builder'

module DatabasePlanner
  class ConvertTablesToXml
    def self.to_xml(tables)
      <<~STRING
        <?xml version="1.0" encoding="utf-8" ?>
        <sql>
          <datatypes db="mysql">
            <group label="Numeric" color="rgb(238,238,170)">
              <type label="Integer" length="0" sql="INTEGER" quote=""/>
              <type label="TINYINT" length="0" sql="TINYINT" quote=""/>
              <type label="SMALLINT" length="0" sql="SMALLINT" quote=""/>
              <type label="MEDIUMINT" length="0" sql="MEDIUMINT" quote=""/>
              <type label="INT" length="0" sql="INT" quote=""/>
              <type label="BIGINT" length="0" sql="BIGINT" quote=""/>
              <type label="Decimal" length="1" sql="DECIMAL" re="DEC" quote=""/>
              <type label="Single precision" length="0" sql="FLOAT" quote=""/>
              <type label="Double precision" length="0" sql="DOUBLE" re="DOUBLE" quote=""/>
            </group>

            <group label="Character" color="rgb(255,200,200)">
              <type label="Char" length="1" sql="CHAR" quote="'"/>
              <type label="Varchar" length="1" sql="VARCHAR" quote="'"/>
              <type label="Text" length="0" sql="MEDIUMTEXT" re="TEXT" quote="'"/>
              <type label="Binary" length="1" sql="BINARY" quote="'"/>
              <type label="Varbinary" length="1" sql="VARBINARY" quote="'"/>
              <type label="BLOB" length="0" sql="BLOB" re="BLOB" quote="'"/>
            </group>

            <group label="Date &amp; Time" color="rgb(200,255,200)">
              <type label="Date" length="0" sql="DATE" quote="'"/>
              <type label="Time" length="0" sql="TIME" quote="'"/>
              <type label="Datetime" length="0" sql="DATETIME" quote="'"/>
              <type label="Year" length="0" sql="YEAR" quote=""/>
              <type label="Timestamp" length="0" sql="TIMESTAMP" quote="'"/>
            </group>

            <group label="Miscellaneous" color="rgb(200,200,255)">
              <type label="ENUM" length="1" sql="ENUM" quote=""/>
              <type label="SET" length="1" sql="SET" quote=""/>
              <type label="Bit" length="0" sql="bit" quote=""/>
            </group>
          </datatypes>
          #{tables_to_xml(tables)}
        </sql>
      STRING
    end

    def self.tables_to_xml(tables)
      string = ''
      x = 300
      tables.each_with_index do |table, index|
        string +=
          <<~STRING
            <table x='#{x + (200 * index)}' y='300' name='#{table[:table]}'>
              <row name='id' null='1' autoincrement='1'>
                <datatype>INTEGER</datatype>
                <default>NULL</default>
              </row>
              #{field_to_xml(table[:fields])}
              <key type='PRIMARY' name=''>
                <part>id</part>
              </key>
            </table>
          STRING
      end
      string.gsub('\n', '').gsub('\\' , '')
    end

    def self.field_to_xml(fields)
      string = ''
      fields.each do |field|
        field[:type] = 'VARCHAR' if field[:type] == 'string'
        relation = field[:name].split('_id').first if field[:type] == 'index'
        string +=
          <<~STRING
            <row name=\"#{field[:name]}\" null=\"1\" autoincrement=\"0\">
              <datatype>#{field[:type].upcase}</datatype>
              <default>NULL</default>
              <relation table="#{relation}s" row="id" />
            </row>
          STRING
      end
      string
    end
  end
end

# TODO - Set Relation
# relations = <relation table="users" row="id" />
