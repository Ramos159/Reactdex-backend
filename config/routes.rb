Rails.application.routes.draw do

  get '/users/index',to:'user#index'
  get '/users/:id', to: 'user#show'
  post '/create_user', to: 'user#create'
  post '/create_team', to:'team#create'
  patch '/update_team/:id', to:'team#update'
  patch '/add_pokemon/:id',to:'team#add_pokemon'
  post '/log_in',to:'auth#login'
  get '/teams/index',to:'team#index'

  post '/sign_up', to:'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get'/pokedexs/index',to: 'pokedex#index'
end
