require "rails_helper"

RSpec.describe "Application Controller", type: :controller do
  before :each do
    user = User.create(username: "Buff MagicKarp", email: "buff@gmail.com", password: "password")
    @request.session[:user_id] = user.id
  end

  it "logs out because of inactivity and redirects to login" do
    @request.session[:last_activity] = 31.minutes.ago

    get "/api/v0/decks"

    expect(session[:user_id]).to eq(nil)
    expect(flash[:notice]).to eq("You have been logged out due to inactivity.")
    expect(response).to redirect_to(login_path)
  end

  it "sad path: does not log out because of inactivity and doesn't redirect to login" do
    @request.session[:last_activity] = 29.minutes.ago

    get "/api/v0/decks"

    expect(session[:user_id]).to_not eq(user.id)
    expect(response).to eq(:ok)
  end
end