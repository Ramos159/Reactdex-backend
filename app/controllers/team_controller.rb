class TeamController < ApplicationController

  def index
    @teams=Team.all
    render json: @teams, includes:['pokemons']
  end

  def create
  end

end
