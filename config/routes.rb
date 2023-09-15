Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :collections, only: [:index, :show]
      resources :cards, only: [:show] do
        collection do
          get "random"
        end
        collection do
          get "search"
        end
      end
    end
  end
end
