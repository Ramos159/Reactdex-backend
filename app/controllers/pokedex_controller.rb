class PokedexController < ApplicationController

  def index
    @pokedexs = Pokedex.all
    render json: @pokedexs
  end

end
