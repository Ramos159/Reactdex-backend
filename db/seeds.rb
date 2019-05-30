# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest_client'
require 'json'
require 'byebug'
require 'pry'


kanto_index=0
kanto_limit=151
johto_index=151
johto_limit=100
hoenn_index=251
hoenn_limit=135
sinnoh_index=386
sinnoh_limit=107
unova_index=496
unova_limit=153
kalos_index=649
kalos_limit=153
special_forms_index=807
special_forms_limit=90

kanto = Pokedex.create(name:"Kanto")
johto = Pokedex.create(name:"Johto")
hoenn = Pokedex.create(name:"Hoenn")
sinnoh = Pokedex.create(name:"Sinnoh")
unova = Pokedex.create(name:"Unova")
kalos = Pokedex.create(name:"Kalos")
special_forms = Pokedex.create(name:"Special Forms")




def pokemon_api_caller(index,limit)
response = RestClient.get "https://pokeapi.co/api/v2/pokemon/?offset=#{index}&limit=#{limit}"
response_JSON = JSON.parse(response)
response_JSON["results"]
end

def pokemon_url_caller(url)
	poke_data = JSON.parse(RestClient.get(url))
end

def pokemon_stat_setter(pokemon,stat_data)
	stat_data["stats"].each do |stats|
		hp,speed,attack,defense = 0

		if stats["stat"]["name"] == "hp"
			pokemon.hp = stats["base_stat"]

		elsif stats["stat"]["name"] == "attack"
			pokemon.attack = stats["base_stat"]

    elsif stats["stat"]["name"] == "special-attack"
      pokemon.sp_attack = stats["base_stat"]

		elsif stats["stat"]["name"] == "defense"
			pokemon.defense = stats["base_stat"]

    elsif stats["stat"]["name"] == "special-defense"
      pokemon.sp_defense = stats["base_stat"]

		else stats["stat"]["name"] == "speed"
			pokemon.speed = stats["base_stat"]
		end
	end
	pokemon
end

def pokemon_type_setter(pokemon, stat_data)
	if stat_data["types"].length == 1
		pokemon.element = stat_data["types"][0]["type"]["name"]
	else
		stat_data["types"].each_with_index do |types, idx|
			if idx == 0
				pokemon.element = types["type"]["name"]
			end
			if idx == 1
				pokemon.element += "/" + types["type"]["name"]
			end
		end

	end
end

def pokemon_sprite_setter(pokemon,pokemon_data)

  if pokemon_data["sprites"]["front_default"] == nil
          pokemon.sprite = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png'
  else
    pokemon.sprite = pokemon_data["sprites"]["front_default"]
  end
end

def create_pokemon(pokemon_data,pokedex_id)

	new_pokemon = Pokemon.new(name:pokemon_data["name"],pokedex_id:pokedex_id, total:0)
	#sets pokemon stats
	pokemon_stat_setter(new_pokemon, pokemon_data)
	#totals stats for total power of pokemon
	new_pokemon.total = new_pokemon.hp + new_pokemon.attack + new_pokemon.defense + new_pokemon.speed + new_pokemon.sp_attack + new_pokemon.sp_defense
	##sets pokemon type
	pokemon_type_setter(new_pokemon, pokemon_data)
  pokemon_sprite_setter(new_pokemon,pokemon_data)
	# Save Pokemon to database
	new_pokemon.save()
end

def pokemon_database_runner(pokedex_id,index,limit)
  pokemon_results_arr = pokemon_api_caller(index,limit)
	pokemon_results_arr.each do |pokemon|
		poke = create_pokemon(pokemon_url_caller(pokemon["url"]),pokedex_id)
	end
end


pokemon_database_runner(kanto.id,kanto_index,kanto_limit)
# puts"finished kanto region pokedex"
# pokemon_database_runner(johto.id,johto_index,johto_limit)
# puts"finished johto region pokedex"
# pokemon_database_runner(hoenn.id,hoenn_index,hoenn_limit)
# puts"finished hoenn region pokedex"
# pokemon_database_runner(sinnoh.id,sinnoh_index,sinnoh_limit)
# puts"finished sinnoh region pokedex"
# pokemon_database_runner(unova.id,unova_index,unova_limit)
# puts"finished unova region pokedex"
# pokemon_database_runner(kalos.id,kalos_index,kalos_limit)
# puts"finished kalos region pokedex"
# pokemon_database_runner(special_forms.id,special_forms_index,special_forms_limit)
# puts"finished special forms pokedex"
 edwin=User.create(username:'edwin',password:'edwin')

 team=Team.create(user_id:edwin.id,name:"OP PLEASE NERF")
 team=Team.create(user_id:edwin.id,name:"YEET")
 # TeamPokemon.create(pokemon_id:1,team_id:1)
 # Team.create(user_id:1,name:"should not appear")
 # Team.create(user_id:1,name:"yeet")
 TeamPokemon.create(pokemon_id:5,team_id:1)
 TeamPokemon.create(pokemon_id:15,team_id:1)
 TeamPokemon.create(pokemon_id:25,team_id:1)
 TeamPokemon.create(pokemon_id:35,team_id:1)
 TeamPokemon.create(pokemon_id:45,team_id:1)
 TeamPokemon.create(pokemon_id:55,team_id:1)
 TeamPokemon.create(pokemon_id:5,team_id:2)
 TeamPokemon.create(pokemon_id:15,team_id:2)
 TeamPokemon.create(pokemon_id:25,team_id:2)
 TeamPokemon.create(pokemon_id:35,team_id:2)
 TeamPokemon.create(pokemon_id:45,team_id:2)
 TeamPokemon.create(pokemon_id:55,team_id:2)
puts"done"
