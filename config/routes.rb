DatabasePlanner::Engine.routes.draw do

  resources :databases, path: '/' do
    collection do
      post :save
    end
  end
end
