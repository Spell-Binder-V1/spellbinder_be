require "rails_helper"

RSpec.describe "CollectionsController" do
  describe "#index" do
    it "returns happy path for collections" do
      get "/api/v0/collections"
      expect(response).to be_successful
      collections_data = JSON.parse(response.body)
      
      expect(collections_data).to have_key("data")
      
      collections = collections_data["data"]
      collections.each do |collection|
        
        attributes = collection["attributes"]
        expect(attributes).to have_key("code")
    
        expect(attributes["code"]).to be_a(String)
        expect(attributes).to have_key("name")
        expect(attributes["name"]).to be_a(String)
        expect(attributes).to have_key("type")
        expect(attributes["type"]).to be_a(String)
        expect(attributes).to have_key("release_date")
        expect(attributes["release_date"]).to be_a(String)
        expect(attributes).to have_key("block")
        expect(attributes["block"]).to be_a(String).or be(nil)
      end
      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    it "return happy path for a collections cards" do
      collection_id = "ARN"
      get "/api/v0/collections/#{collection_id}"
      expect(response).to be_successful

      collection_raw_data = JSON.parse(response.body)
      collection_data = collection_raw_data["data"][0]
    
      expect(collection_data).to have_key("id")
      expect(collection_data["id"]).to be_a(String)
      expect(collection_data).to have_key("type")
      expect(collection_data["type"]).to be_a(String)
      expect(collection_data).to have_key("attributes")
      expect(collection_data["attributes"]).to be_a(Hash)

      attributes = collection_data["attributes"]

      expect(attributes).to have_key("id")
      expect(attributes["id"]).to be_a(Integer)
      expect(attributes).to have_key("multiverseid")
      expect(attributes["multiverseid"]).to be_a(String)
      expect(attributes).to have_key("name")
      expect(attributes["name"]).to be_a(String)
      expect(attributes).to have_key("mana_cost")
      expect(attributes["mana_cost"]).to be_a(String)
      expect(attributes).to have_key("converted_mana_cost")
      expect(attributes["converted_mana_cost"]).to be_an(Float)
      expect(attributes).to have_key("colors")
      expect(attributes["colors"]).to be_a(Array)
      expect(attributes).to have_key("color_identity")
      expect(attributes["color_identity"]).to be_a(Array)
      expect(attributes).to have_key("type")
      expect(attributes["type"]).to be_a(String)
      expect(attributes).to have_key("types")
      expect(attributes["types"]).to be_a(Array)
      expect(attributes).to have_key("subtypes")
      expect(attributes["subtypes"]).to be_a(Array)
      expect(attributes).to have_key("rarity")
      expect(attributes["rarity"]).to be_a(String)
      expect(attributes).to have_key("set")
      expect(attributes["set"]).to be_a(String)
      expect(attributes).to have_key("text")
      expect(attributes["text"]).to be_a(String)
      expect(attributes).to have_key("artist")
      expect(attributes["artist"]).to be_a(String)
      expect(attributes).to have_key("number")
      expect(attributes["number"]).to be_a(String)
      expect(attributes).to have_key("power")
      expect(attributes["power"]).to be_a(String)
      expect(attributes).to have_key("toughness")
      expect(attributes["toughness"]).to be_a(String)
      expect(attributes).to have_key("image_url")
      expect(attributes["image_url"]).to be_a(String)
      expect(attributes).to have_key("rulings")
      expect(attributes["rulings"]).to be_an(Array).or be(nil)

      expect(response.status).to eq(200)
    end

    it "return sad path for a collection of cards" do
      collection_invalid_id = "invalid_id"
      get "/api/v0/collections/#{collection_invalid_id}"

      expect(response).to have_http_status(:not_found)
      expect(response.status).to eq(404)
      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:error)
    end
  end
end