class UserController < ApplicationController

  def index
    @users=User.all
    render json: @users
  end

  def show
    user=User.find(params[:id])
    render json: @user
  end

  def create
    user = User.new(
      username:params[:username],
      password_digest:params[:password]
    )
    if user.save
    token = encode_token(user)
			render json: {user: UserSerializer.new(user), token: token}
		else
			render json: {errors: user.errors.full_messages}
		end
  end



end
