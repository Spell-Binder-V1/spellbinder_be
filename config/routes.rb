Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :users, only: [:new, :create]
      resources :collections, only: [:index, :show]
      resources :cards, only: [:show] do
        collection do
          get "random"
        end
      end
      get 'search', to: 'search#search'
    end
  end
end
