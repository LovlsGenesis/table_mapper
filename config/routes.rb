DatabasePlanner::Engine.routes.draw do
  get '/plan_databases', to: 'plan_databases#index'
end
