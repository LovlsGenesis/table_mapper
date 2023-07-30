require "database_planner/version"
require "database_planner/engine"

require 'database_planner/config'
require 'database_planner/read_table'
require 'database_planner/get_tables'

require 'database_planner/render_migrations'
require 'database_planner/render_migration'
require 'database_planner/tables'

raise 'I need Rails to run!' unless Kernel.const_defined? 'Rails'

module DatabasePlanner
  def self.hi
    puts 'Hello World'
  end
end
