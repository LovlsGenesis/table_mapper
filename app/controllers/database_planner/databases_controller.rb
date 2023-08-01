require 'database_planner/config'
require 'database_planner/read_table'
require 'database_planner/convert_tables_to_xml'
require 'rexml/document'

module DatabasePlanner
  class DatabasesController < ApplicationController
    def index
      @file = DatabasePlanner::Config.schema_file
      @tables = DatabasePlanner::ReadTable.new(@file).read_file
      @xml = DatabasePlanner::ConvertTablesToXml.to_xml(@tables)

      respond_to do |format|
        format.html
      end
    end

    # Post
    def save
      puts '*' * 50
      params.delete('authenticity_token')
      params.delete('controller')
      params.delete('action')
      puts params.values
      puts '*' * 50


      render json: { message: 'Saved' }
    end
  end
end
