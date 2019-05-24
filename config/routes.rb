Rails.application.routes.draw do

  get '/users/index',to:'user#index'
  get '/teams/index',to:'team#index'

  post '/sign_up', to:'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get'/pokedexs/index',to: 'pokedex#index'
end
