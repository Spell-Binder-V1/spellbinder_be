require "rails_helper"

RSpec.describe "Application Controller", type: :feature do
  before :each do
    user = User.create!(username: "Buff MagicKarp", email: "buff@gmail.com", password: "password")
    # session[:user_id] = user.id
    allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })
  end

  it "logs out because of inactivity and redirects to login" do
    session[:last_activity] = 31.minutes.ago
    # @controller = ApplicationController.new

    get "/api/v0/decks"

    expect(session[:user_id]).to eq(nil)
    expect(flash[:notice]).to eq("You have been logged out due to inactivity.")
    expect(response.status).to eq(302)
  end

  it "sad path: does not log out because of inactivity and doesn't redirect to login" do
    session[:last_activity] = 29.minutes.ago

    get "/api/v0/decks"

    expect(session[:user_id]).to_not eq(user.id)
    expect(response).to eq(:ok)
  end
end

# allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })