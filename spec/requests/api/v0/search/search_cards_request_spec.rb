require "rails_helper"

RSpec.describe "Cards Controller" do
  context 'GET /search' do
    scenario "returns a random card" do
      card_search_params = ({q: "Black Lotus"})

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v0/search", headers: headers, params: card_search_params

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end

  context 'GET /search happy & sad' do
    scenario "returns http success" do
      card_search_params = ({q: "Black Lotus"})

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v0/search", headers: headers, params: card_search_params

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    scenario "returns http not found" do
      card_search_params = ({q: "Holo Ghost Face Pikachu"})

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/api/v0/search", headers: headers, params: card_search_params
      
      error = JSON.parse(response.body)
      expect(response).to have_http_status(:not_found)
      expect(response.status).to eq(404)
      expect(error["error"]).to eq("No cards found")
    end
  end
end