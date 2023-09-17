require 'rails_helper'

RSpec.describe "Users create" do
  describe "POST create" do
    context "with valid parameters it creates a user" do
      scenario "creates a new User" do
        valid_attributes = { username: 'Buff MagicKarp', email: 'level1@gang.com', password: 'password' }
        expect {
          post api_v0_users_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
      scenario "renders a JSON response with the new user" do
        valid_attributes = { username: 'Buff MagicKarp', email: 'level1@gang.com', password: 'password' }
        post api_v0_users_path, params: { user: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
    context "with invalid parameters" do
      scenario "does not create a new User" do
        invalid_attributes = { username: '', email: '', password: '' }
        expect {
          post api_v0_users_path, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end
      it "renders a JSON response with errors for the new user" do
        invalid_attributes = { username: '', email: '', password: '' }
        post api_v0_users_path, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end