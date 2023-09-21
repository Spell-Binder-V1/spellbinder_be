# require "rails_helper"

# RSpec.describe "timed inactive logout", type: :request do
#   before :each do
#     valid_attributes = { username: 'Buff MagicKarp', email: 'level@gang' }
#     User.create(valid_attributes)
#     @user = User.last
#     valid_data = { username: 'Buff MagicKarp' }
#     allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: @user.id })
#     post api_v0_login_path, params: valid_data
#   end

#   it "logs out because of inactivity and redirects to login" do
#     session[:last_activity] = 31.minutes.ago

#     get "/api/v0/decks"

#     expect(session[:user_id]).to eq(nil)
#     expect(response.status).to eq(200)
#   end

#   it "sad path: does not log out because of inactivity and doesn't redirect to login" do
#     session[:last_activity] = 29.minutes.ago

#     get "/api/v0/decks"

#     expect(session[:user_id]).to_not eq(@user.id)
#     expect(response.status).to eq(200)
#   end
# end
