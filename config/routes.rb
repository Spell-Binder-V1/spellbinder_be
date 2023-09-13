Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :collections, only: [:index]
    end
  end
end
