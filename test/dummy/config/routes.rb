Rails.application.routes.draw do
  mount DatabasePlanner::Engine => "/database_planner"
end
