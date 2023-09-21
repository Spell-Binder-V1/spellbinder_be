require "rails_helper"
RSpec.describe "POST /api/v0/login", type: :request do
  before :each do
    valid_attributes = { username: 'Buff MagicKarp', email: 'level@gang' }
    User.create(valid_attributes)
  end
  describe "with valid credentials" do
    it "logs in a user" do
      valid_data = { username: 'Buff MagicKarp' }
      post api_v0_login_path, params: valid_data
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including("application/json"))
    end

    it "sad path - invalid credentials" do
      invalid_data = { username: 'Buff MagicKarp' }
      post api_v0_login_path, params: invalid_data
      expect(response).to have_http_status(:unauthorized)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end
end