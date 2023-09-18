class Api::V0::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      render json: user, status: :ok
    else
      flash[:error] = "Invalid credentials."
      render json: user.errors, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end