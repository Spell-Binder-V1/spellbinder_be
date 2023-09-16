class Api::V0::UsersController < ApplicationController
  def new 
    @user = User.new
  end

    def create
      user = user_params
      facade = UserFacade.new
      new_user = facade.recieve_user_data(user)
      render json: UserSerializer.new(new_user), status: :created
      User.create!(user_params)
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
    params.require(:user).permit(:username, :password_digest, :email, :id)
  end
end