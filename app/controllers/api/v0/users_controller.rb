class Api::V0::UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(UserFacade.new.recieve_user_data(user)), status: :created
    else 
      render json: {error: "Invalid user data"}, status: :unprocessable_entity
    end
  end

  #  ? def login_form
  #  ? end

  # // def login
  #  //  user = User.find_by(username: params[:username])
  #  //  if user.authenticate(params[:password])
  #   //   session[:user_id] = user.id
  #     # TODO possible render json success message?
  #  //  end
  #     # TODO error messgage
  # // end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :email)
  end
end