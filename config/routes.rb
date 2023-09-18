Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :users, only: [:create], path: 'register'
      resources :collections, only: [:index, :show]
      resources :cards, only: [:show] do
      get '/random', to: 'cards#random'
      get '/search', to: 'search#search'
      resources :decks
    end
  end
end


# | get | '/api/v0/register' |
# | post | '/api/v0/register |
# | get | '/api/v0/login' |
# | post | '/api/v0/login' |
# | delete | '/api/v0/logout' |