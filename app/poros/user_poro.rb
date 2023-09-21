class UserPoro
  attr_reader :username, :email, :id
  def initialize(user_params)
    @id = user_params[:id]
    @username = user_params[:username]
    @email = user_params[:email]
  end
end