class TeamController < ApplicationController

  def index
    @teams=Team.all
    render json: @teams
  end

  def create
    team = Team.create(user_id: params[:user], name: params[:searchTerm])
    render json: team
  end

  def update
    team = Team.find(params[:id])
    if team.update(name:params[:name])
      render json: team
    else
      render json: {errors:'no good'}
    end
  end



end
