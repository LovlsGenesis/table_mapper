module DatabasePlanner
  class PlanDatabasesController < ApplicationController

    # GET /plan_databases
    def index
      @tables = DatabasePlanner::Tables.new.tables
    end

    private

  end
end
