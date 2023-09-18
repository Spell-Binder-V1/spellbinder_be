Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :users, only: [:create], path: 'register'
      resources :decks, only: [:create, :index, :show, :update, :destroy], path: 'decks' do 
      post 'add_card', to: 'decks#add_card'
      end
      resources :collections, only: [:index, :show]
      get 'cards/random', to: 'cards#random'
      resources :cards, only: [:show]
      get 'search', to: 'search#search'

      post 'login', to: 'users#login'

    end
  end
end


# | get | '/api/v0/register' |
# | post | '/api/v0/register |
# | get | '/api/v0/login' |
# | post | '/api/v0/login' |
# | delete | '/api/v0/logout' |