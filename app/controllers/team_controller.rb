class TeamController < ApplicationController

  def index
    @teams=Team.all
    render json: @teams
  end

  def create
    user = session_user
    team = Team.new(user_id: user.id, name: params[:searchTerm])
    if team.save
    render json: team
  else render json: {errors:"you are either capped on teams or tried to name two teams the same name!"}
  end
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

  def destroy
    user = session_user
    team = Team.find(request.headers["TeamID"])
    team.destroy
    teams = Team.all
    render json: teams
  end


  end
