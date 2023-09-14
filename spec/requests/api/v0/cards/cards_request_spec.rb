require "rails_helper"

RSpec.describe "Cards Controller" do
  describe "#random" do
    it "returns happy path for a random card" do
      get "/api/v0/cards/random"
      expect(response).to be_successful
      random_card_data = JSON.parse(response.body)

      card_data = random_card_data["data"][0]

      expect(card_data).to have_key("id")
      expect(card_data["id"]).to be_a(String)
      expect(card_data).to have_key("type")
      expect(card_data["type"]).to be_a(String)
      expect(card_data).to have_key("attributes")
      expect(card_data["attributes"]).to be_a(Hash)

      attributes = card_data["attributes"]

      expect(attributes).to have_key("id")
      expect(attributes["id"]).to be_a(Integer)
      expect(attributes).to have_key("multiverseid")
      expect(attributes["multiverseid"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("name")
      expect(attributes["name"]).to be_a(String)
      expect(attributes).to have_key("mana_cost")
      expect(attributes["mana_cost"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("converted_mana_cost")
      expect(attributes["converted_mana_cost"]).to be_an(Float)
      expect(attributes).to have_key("colors")
      expect(attributes["colors"]).to be_a(Array).or be_a(String).or be(nil)
      expect(attributes).to have_key("color_identity")
      expect(attributes["color_identity"]).to be_a(Array).or be(nil)
      expect(attributes).to have_key("type")
      expect(attributes["type"]).to be_a(String)
      expect(attributes).to have_key("types")
      expect(attributes["types"]).to be_a(Array).or be_a(String)
      expect(attributes).to have_key("subtypes")
      expect(attributes["subtypes"]).to be_a(Array).or be(nil)
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
      expect(attributes["power"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("toughness")
      expect(attributes["toughness"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("image_url")
      expect(attributes["image_url"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("rulings")
      expect(attributes["rulings"]).to be_an(Array).or be(nil)

      expect(response.status).to eq(200)
    end
  end

  describe "card show" do
    it "returns happy path for a specific card" do
      card_id = 600
      get "/api/v0/cards/#{card_id}"

      expect(response).to be_successful

      random_card_data = JSON.parse(response.body)

      card_data = random_card_data["data"]

      expect(card_data).to have_key("id")
      expect(card_data["id"]).to be_a(String)
      expect(card_data).to have_key("type")
      expect(card_data["type"]).to be_a(String)
      expect(card_data).to have_key("attributes")
      expect(card_data["attributes"]).to be_a(Hash)

      attributes = card_data["attributes"]

      expect(attributes).to have_key("id")
      expect(attributes["id"]).to be_a(Integer)
      expect(attributes).to have_key("multiverseid")
      expect(attributes["multiverseid"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("name")
      expect(attributes["name"]).to be_a(String)
      expect(attributes).to have_key("mana_cost")
      expect(attributes["mana_cost"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("converted_mana_cost")
      expect(attributes["converted_mana_cost"]).to be_an(Float)
      expect(attributes).to have_key("colors")
      expect(attributes["colors"]).to be_a(Array).or be_a(String).or be(nil)
      expect(attributes).to have_key("color_identity")
      expect(attributes["color_identity"]).to be_a(Array).or be(nil)
      expect(attributes).to have_key("type")
      expect(attributes["type"]).to be_a(String)
      expect(attributes).to have_key("types")
      expect(attributes["types"]).to be_a(Array).or be_a(String)
      expect(attributes).to have_key("subtypes")
      expect(attributes["subtypes"]).to be_a(Array).or be(nil)
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
      expect(attributes["power"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("toughness")
      expect(attributes["toughness"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("image_url")
      expect(attributes["image_url"]).to be_a(String).or be(nil)
      expect(attributes).to have_key("rulings")
      expect(attributes["rulings"]).to be_an(Array).or be(nil)

      expect(response.status).to eq(200)
    end

    it "return sad path for a cards show" do
      card_invalid_id = "invalid_id"
      get "/api/v0/cards/#{card_invalid_id}"

      expect(response).to have_http_status(:not_found)
      expect(response.status).to eq(404)
      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:errors)
    end
  end
end