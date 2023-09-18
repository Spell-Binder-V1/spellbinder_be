module SessionHelper
  def logged_in?
    return if current_user
      redirect_back(fallback_location: api_v0_search_path)
      flash[:error] = "You must be logged in or registered to create a deck."
  end
end 