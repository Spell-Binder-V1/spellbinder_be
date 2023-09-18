Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :users, only: [:create], path: 'register'
      resources :decks, only: [:create, :index, :show, :update, :destroy], path: 'decks' do 
      post 'add_card', to: 'decks#add_card'
      post 'remove_card', to: 'decks#remove_card'
      end
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


# | get | '/api/v0/register' |
# | post | '/api/v0/register |
# | get | '/api/v0/login' |
# | post | '/api/v0/login' |
# | delete | '/api/v0/logout' |