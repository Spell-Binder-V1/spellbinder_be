require 'rails_helper'

RSpec.describe "decks show" do  
  describe "#index" do
    it "GET decks" do 
      @user = User.create!(username: 'Buff MagicKarp', email: 'level@gang', password: 'password')
      @deck = @user.decks.create!(name: 'dreams')
      @deck2 = @user.decks.create!(name: 'dreams2')
      @deck3 = @user.decks.create!(name: 'dreams3')
      @card = "Black Lotus"
      @card2 = "The One Ring"
      @card3 = "Mox Sapphire"
      @card4 = "Mox Ruby"
      @card5 = "Mox Emerald"
      @card6 = "Mox Pearl"
      @card7 = "Mox Jet"
      @card8 = "Mox Diamond"
      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: @user.id })
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'main_board', card: @card }
      post api_v0_deck_add_card_path(@deck2.id), params: { list: 'main_board', card: @card2 }
      post api_v0_deck_add_card_path(@deck3.id), params: { list: 'side_board', card: @card3 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'maybe_board', card: @card4 }
      post api_v0_deck_add_card_path(@deck2.id), params: { list: 'maybe_board', card: @card5 }
      post api_v0_deck_add_card_path(@deck3.id), params: { list: 'maybe_board', card: @card6 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'maybe_board', card: @card7 }
      post api_v0_deck_add_card_path(@deck2.id), params: { list: 'maybe_board', card: @card8 }
      get api_v0_decks_path
      
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_a(Array)
      expect(json.count).to eq(3)
      json.each do |deck|
        expect(deck).to have_key(:name)
        cards = deck[:cards]

        expect(cards[:main_board]).to be_a(Array)
        expect(cards[:side_board]).to be_a(Array)
        expect(cards[:maybe_board]).to be_a(Array)

        cards[:main_board].each do |card|
          expect(card).to be_a(Array)
        end
      end
    end
  end

  describe "sad path" do
    it "returns empty if user has no decks" do
      user = User.create!(username: 'UniqueUsername', email: 'unique@example.com', password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

    get api_v0_decks_path

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to include('application/json')

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.count).to eq(0)
    end

    it "returns an error if user is not logged in" do
      get api_v0_decks_path

      expect(response).to have_http_status(302)
    end
  end
end
