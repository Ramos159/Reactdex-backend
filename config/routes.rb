Rails.application.routes.draw do

  get '/users/index',to:'user#index'
  get '/users/:id', to: 'user#show'
  post '/create_user', to: 'user#create'
  post '/create_team', to:'team#create'
  patch '/update_team/:id', to:'team#update'
  patch '/add_pokemon/:id',to:'team#updatepokemon'
  post '/login', to:'auth#login'
  get '/teams/index', to:'team#index'
  delete '/delete_team', to: 'team#destroy'
  post '/add_pokemon_to_team', to: 'team#add_pokemon'
  delete '/delete_pokemon_from_team', to: 'team#delete_pokemon_from_team'

  post '/sign_up', to:'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post'/auto_login',to:'auth#auto_login'
  get'/pokedexs/index',to: 'pokedex#index'
end
