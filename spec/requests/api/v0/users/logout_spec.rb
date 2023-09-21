require "rails_helper"

RSpec.describe "DELETE /api/v0/login", type: :request do
  before :each do
    valid_attributes = { username: 'Buff MagicKarp', email: 'level@gang' }
    User.create(valid_attributes)
    valid_data = { username: 'Buff MagicKarp', password: 'password' }
    post api_v0_login_path, params: valid_data
  end

  it "logs out a user" do
    delete api_v0_logout_path
    expect(response).to have_http_status(:ok)
    expect(response.content_type).to match(a_string_including("application/json"))
  end
end