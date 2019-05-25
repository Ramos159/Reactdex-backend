class TeamController < ApplicationController

  def index
    @teams=Team.all
    render json: @teams
  end

  def create
  end

end
