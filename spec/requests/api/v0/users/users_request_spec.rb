require 'rails_helper'

RSpec.describe 'Users', type: :request do 
  describe 'POST /users' do
    it "creates a new user" do 
      user_params = {
                      username: "goku", 
                      email: "Kamehameha@gmail.com", 
                      password_digest: "password"
                    }


      headers = { 'CONTENT_TYPE' => 'application/json'}

      post '/api/v0/users', headers: headers, params: JSON.generate(user_params)

      expect(response).to have_http_status(:created)
      expect(response).to be_successful
      # expect(response.body).to eq(UserSerializer.new(User.last))
    end
  end
end
