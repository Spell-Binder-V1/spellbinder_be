require "rails_helper"

RSpec.describe "POST /api/v0/login", type: :request do
  before :each do
    valid_attributes = {username: 'Buff MagicKarp', email: 'level@gang', password: 'password'}
    expect {
      post api_v0_users_path, params: { user: valid_attributes }
    }.to change(User, :count).by(1)    # allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: @user.id })
  end
  describe "with valid credentials" do
    
    it "logs in a user" do
      valid_attributes = { username: 'Buff MagicKarp', password: 'password' }
      post api_v0_login_path, params: { user: valid_attributes }

      
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end
end