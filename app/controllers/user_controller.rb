class UserController < ApplicationController

  def index
    @users=User.all
    render json: @users, include:'**'
  end

  def create
  end
end
