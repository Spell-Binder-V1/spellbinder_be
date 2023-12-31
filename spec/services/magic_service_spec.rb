require "rails_helper"

RSpec.describe "MagicService" do
  describe "#class methods" do
    describe "#get_collections" do
      it "can get all collections", :vcr do

        collection = MagicService.get_collections

        expect(collection).to be_an(Hash)
        expect(collection).to have_key(:sets)
        expect(collection[:sets]).to be_a(Array)
        expect(collection[:sets].first).to have_key(:name)
        expect(collection[:sets].first[:name]).to be_a(String)
        expect(collection[:sets].first).to have_key(:code)
        expect(collection[:sets].first[:code]).to be_a(String)
        expect(collection[:sets].first).to have_key(:type)
        expect(collection[:sets].first[:type]).to be_a(String)
        expect(collection[:sets].first).to have_key(:releaseDate)
        expect(collection[:sets].first[:releaseDate]).to be_a(String)
        expect(collection[:sets].first).to have_key(:block)
        expect(collection[:sets].first[:block]).to be_a(String)
      end
    end

    describe "#get_collection_details" do
      it "can get details for a specific collection", :vcr do
        collection_id = "arn"
        collection = MagicService.get_collection_details(collection_id)

        expect(collection).to be_an(Hash)
        expect(collection).to have_key(:set)
        expect(collection[:set]).to have_key(:code)
        expect(collection[:set][:code]).to be_a(String)
        expect(collection[:set]).to have_key(:name)
        expect(collection[:set][:name]).to be_a(String)
        expect(collection[:set]).to have_key(:type)
        expect(collection[:set][:type]).to be_a(String)
        expect(collection[:set]).to have_key(:releaseDate)
        expect(collection[:set][:releaseDate]).to be_a(String)
      end
    end


    describe "#get_collection_cards" do
      it "returns all cards for a specific collection", :vcr do
        collection_code = "arn"
        collection = MagicService.get_collection_cards(collection_code)

        expect(collection).to be_an(Hash)
        expect(collection.first).to be_a(Array)
        expect(collection[:cards].first).to have_key(:name)
        expect(collection[:cards].first[:name]).to be_a(String)
        expect(collection[:cards].first).to have_key(:manaCost)
        expect(collection[:cards].first[:manaCost]).to be_a(String).or be(nil)
        expect(collection[:cards].first).to have_key(:cmc)
        expect(collection[:cards].first[:cmc]).to be_a(Float)
        expect(collection[:cards].first).to have_key(:colors)
        expect(collection[:cards].first[:colors]).to be_a(Array).or be_a(String).or be(nil)
        expect(collection[:cards].first).to have_key(:colorIdentity)
        expect(collection[:cards].first[:colorIdentity]).to be_a(Array).or be(nil)
        expect(collection[:cards].first).to have_key(:type)
        expect(collection[:cards].first[:type]).to be_a(String)
        expect(collection[:cards].first).to have_key(:types)
        expect(collection[:cards].first[:types]).to be_a(Array).or be_a(String)
        expect(collection[:cards].first).to have_key(:subtypes)
        expect(collection[:cards].first[:subtypes]).to be_a(Array).or be(nil)
        expect(collection[:cards].first).to have_key(:set)
        expect(collection[:cards].first[:set]).to be_a(String)
        expect(collection[:cards].first).to have_key(:setName)
        expect(collection[:cards].first[:setName]).to be_a(String)
        expect(collection[:cards].first).to have_key(:text)
        expect(collection[:cards].first[:text]).to be_a(String)
        expect(collection[:cards].first).to have_key(:artist)
        expect(collection[:cards].first[:artist]).to be_a(String)
        expect(collection[:cards].first).to have_key(:number)
        expect(collection[:cards].first[:number]).to be_a(String)
        expect(collection[:cards].first).to have_key(:power)
        expect(collection[:cards].first[:power]).to be_a(String).or be(nil)
        expect(collection[:cards].first).to have_key(:toughness)
        expect(collection[:cards].first[:toughness]).to be_a(String).or be(nil)
        expect(collection[:cards].first).to have_key(:layout)
        expect(collection[:cards].first[:layout]).to be_a(String)
        expect(collection[:cards].first).to have_key(:multiverseid)
        expect(collection[:cards].first[:multiverseid]).to be_a(String)
        expect(collection[:cards].first).to have_key(:imageUrl)
        expect(collection[:cards].first[:imageUrl]).to be_a(String)
        expect(collection[:cards].first).to have_key(:printings)
        expect(collection[:cards].first[:printings]).to be_a(Array)
        expect(collection[:cards].first).to have_key(:originalText)
        expect(collection[:cards].first[:originalText]).to be_a(String)
        expect(collection[:cards].first).to have_key(:originalType)
        expect(collection[:cards].first[:originalType]).to be_a(String)
        expect(collection[:cards].first).to have_key(:legalities)
        expect(collection[:cards].first[:legalities]).to be_a(Array)
        expect(collection[:cards].first).to have_key(:id)
        expect(collection[:cards].first[:id]).to be_a(String)
      end
    end

    describe "#get_card_show" do
      it "returns details for a specific card", :vcr do
        card_id = "3dd0bd56-5340-5542-8457-646b9acd58ff"
        collection = MagicService.get_card_show(card_id)

        expect(collection).to be_an(Hash)
        expect(collection[:card]).to have_key(:name)
        expect(collection[:card][:name]).to be_a(String)
        expect(collection[:card]).to have_key(:manaCost)
        expect(collection[:card][:manaCost]).to be_a(String).or be(nil)
        expect(collection[:card]).to have_key(:cmc)
        expect(collection[:card][:cmc]).to be_a(Float)
        expect(collection[:card]).to have_key(:colors)
        expect(collection[:card][:colors]).to be_a(Array).or be_a(String).or be(nil)
        expect(collection[:card]).to have_key(:colorIdentity)
        expect(collection[:card][:colorIdentity]).to be_a(Array).or be(nil)
        expect(collection[:card]).to have_key(:type)
        expect(collection[:card][:type]).to be_a(String)
        expect(collection[:card]).to have_key(:types)
        expect(collection[:card][:types]).to be_a(Array).or be_a(String)
        expect(collection[:card]).to have_key(:subtypes)
        expect(collection[:card][:subtypes]).to be_a(Array).or be(nil)
        expect(collection[:card]).to have_key(:set)
        expect(collection[:card][:set]).to be_a(String)
        expect(collection[:card]).to have_key(:setName)
        expect(collection[:card][:setName]).to be_a(String)
        expect(collection[:card]).to have_key(:text)
        expect(collection[:card][:text]).to be_a(String)
        expect(collection[:card]).to have_key(:artist)
        expect(collection[:card][:artist]).to be_a(String)
        expect(collection[:card]).to have_key(:number)
        expect(collection[:card][:number]).to be_a(String)
        expect(collection[:card]).to have_key(:power)
        expect(collection[:card][:power]).to be_a(String).or be(nil)
        expect(collection[:card]).to have_key(:toughness)
        expect(collection[:card][:toughness]).to be_a(String).or be(nil)
        expect(collection[:card]).to have_key(:layout)
        expect(collection[:card][:layout]).to be_a(String)
        expect(collection[:card]).to have_key(:multiverseid)
        expect(collection[:card][:multiverseid]).to be_a(String)
        expect(collection[:card]).to have_key(:imageUrl)
        expect(collection[:card][:imageUrl]).to be_a(String)
        expect(collection[:card]).to have_key(:printings)
        expect(collection[:card][:printings]).to be_a(Array)
        expect(collection[:card]).to have_key(:originalText)
        expect(collection[:card][:originalText]).to be_a(String)
        expect(collection[:card]).to have_key(:originalType)
        expect(collection[:card][:originalType]).to be_a(String)
        expect(collection[:card]).to have_key(:legalities)
        expect(collection[:card][:legalities]).to be_a(Array)
        expect(collection[:card]).to have_key(:id)
        expect(collection[:card][:id]).to be_a(String)
      end
    end

    describe "#get_random_card" do
      it "returns a random card", :vcr do
        random_card = MagicService.get_random_card

        expect(random_card).to be_an(Hash)
        expect(random_card[:cards]).to be_an(Array)
        expect(random_card[:cards].first).to have_key(:name)
        expect(random_card[:cards].first[:name]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:manaCost)
        expect(random_card[:cards].first[:manaCost]).to be_a(String).or be(nil)
        expect(random_card[:cards].first).to have_key(:cmc)
        expect(random_card[:cards].first[:cmc]).to be_a(Float)
        expect(random_card[:cards].first).to have_key(:type)
        expect(random_card[:cards].first[:type]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:types)
        expect(random_card[:cards].first[:types]).to be_a(Array).or be_a(String)
        expect(random_card[:cards].first).to have_key(:set)
        expect(random_card[:cards].first[:set]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:setName)
        expect(random_card[:cards].first[:setName]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:text)
        expect(random_card[:cards].first[:text]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:artist)
        expect(random_card[:cards].first[:artist]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:number)
        expect(random_card[:cards].first[:number]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:layout)
        expect(random_card[:cards].first[:layout]).to be_a(String)
        expect(random_card[:cards].first).to have_key(:printings)
        expect(random_card[:cards].first[:printings]).to be_a(Array)
        expect(random_card[:cards].first).to have_key(:legalities)
        expect(random_card[:cards].first[:legalities]).to be_a(Array)
        expect(random_card[:cards].first).to have_key(:id)
        expect(random_card[:cards].first[:id]).to be_a(String)
      end
    end

    describe "#get_card_search" do
      it "returns a card search", :vcr do
        card_name = "Black Lotus"
        search = MagicService.get_card_search(card_name)

        expect(search).to be_an(Hash)
        expect(search[:cards]).to be_an(Array)
        expect(search[:cards].first).to have_key(:name)
        expect(search[:cards].first[:name]).to be_a(String)
        expect(search[:cards].first).to have_key(:manaCost)
        expect(search[:cards].first[:manaCost]).to be_a(String).or be(nil)
        expect(search[:cards].first).to have_key(:cmc)
        expect(search[:cards].first[:cmc]).to be_a(Float)
        expect(search[:cards].first).to have_key(:type)
        expect(search[:cards].first[:type]).to be_a(String)
        expect(search[:cards].first).to have_key(:types)
        expect(search[:cards].first[:types]).to be_a(Array).or be_a(String)
        expect(search[:cards].first).to have_key(:set)
        expect(search[:cards].first[:set]).to be_a(String)
        expect(search[:cards].first).to have_key(:setName)
        expect(search[:cards].first[:setName]).to be_a(String)
        expect(search[:cards].first).to have_key(:text)
        expect(search[:cards].first[:text]).to be_a(String)
        expect(search[:cards].first).to have_key(:artist)
        expect(search[:cards].first[:artist]).to be_a(String)
        expect(search[:cards].first).to have_key(:number)
        expect(search[:cards].first[:number]).to be_a(String)
        expect(search[:cards].first).to have_key(:layout)
        expect(search[:cards].first[:layout]).to be_a(String)
        expect(search[:cards].first).to have_key(:multiverseid)
        expect(search[:cards].first[:multiverseid]).to be_a(String)
        expect(search[:cards].first).to have_key(:imageUrl)
        expect(search[:cards].first[:imageUrl]).to be_a(String)
        expect(search[:cards].first).to have_key(:printings)
        expect(search[:cards].first[:printings]).to be_a(Array)
        expect(search[:cards].first).to have_key(:originalText)
        expect(search[:cards].first[:originalText]).to be_a(String)
        expect(search[:cards].first).to have_key(:originalType)
        expect(search[:cards].first[:originalType]).to be_a(String)
        expect(search[:cards].first).to have_key(:legalities)
        expect(search[:cards].first[:legalities]).to be_a(Array)
        expect(search[:cards].first).to have_key(:id)
        expect(search[:cards].first[:id]).to be_a(String)
      end
    end
  end
end