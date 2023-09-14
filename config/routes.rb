Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :collections, only: [:index, :show]
      resources :cards, only: [:show] do
        collection do
          get "random"
        end
      end
    end
  end
end
