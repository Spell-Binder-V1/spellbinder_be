class UserPoro
  attr_reader :username, :email, :id
  def initialize(user_params)
    # require 'pry'; binding.pry
    @id = user_params[:id]
    @username = user_params[:username]
    @email = user_params[:email]
    # @password_digest = user_params[:password_digest]
  end
end