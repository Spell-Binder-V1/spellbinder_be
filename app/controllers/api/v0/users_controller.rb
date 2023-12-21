class Api::V0::UsersController < ApplicationController

  def create
    if User.exists?(user_params)
      user = User.find(user_params[:id])
      render json: user, status: :ok
    else
      user = User.new(user_params)
      if user.exists?  || user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end

#   def login
#     user = User.find_by(username: params[:username])
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       flash[:success] = "Welcome, #{user.username}!"
#       render json: user, status: :ok
#     else
#       flash[:error] = "Invalid credentials."
#       render json: user.errors, status: :unauthorized
#     end
#   end

#   def logout
#     session.delete(:user_id)
#     render json: { message: "You have successfully logged out." }, status: :ok
#   end

#   private

#   def user_params
#     params.require(:user).permit(:username, :email, :uid, :provider, :id, :created_at, :updated_at)
#   end

#   def user_login_params
#     params.require(:user).permit(:username, :password)
#   end
end