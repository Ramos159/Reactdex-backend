class TeamController < ApplicationController

  def index
    @teams=Team.all
    render json: @teams
  end

  def create
    team = Team.new(
      user_id:params[:id],
      name:params[:name]
    )
  end

  def update
    @team = Team.find(params[:id])
    if team.update(name:params[:name])
      render json: @team
    else
      render json: {errors:'no good'}
  end
  end

  def add_pokemon
    team = Team.find(params[:id])
    pokemon = Pokemon.find(params[:pokemon])
    if team.pokemons.length === 6
      render json:{errors:"you are capped on pokemon for this team"}
    else
      if TeamPokemon.create(team_id:team.id,pokemon_id:pokemon.id)
        render json: @team
      else render json:{errors:"idfk chief"}
      end

    end
  end



end
