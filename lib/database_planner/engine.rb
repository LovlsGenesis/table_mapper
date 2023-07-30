module DatabasePlanner
  class Engine < ::Rails::Engine
    isolate_namespace DatabasePlanner

    initializer 'assets' do |app|
      app.config.assets.precompile += %w( database_planner_manifest database_planner/application.css database_planner/application.js)
    end
  end
end
