require 'rails_helper'

RSpec.describe 'decks show' do
  describe '#show' do
    before :each do
      @user = User.create!(username: 'Buff MagicKarp', email: 'level@gang', password: 'password')
      @deck = @user.decks.create!(name: 'dreams')
      @card = "Black Lotus"
      @card2 = "The One Ring"
      @card3 = "Mox Sapphire"
      @card4 = "Mox Ruby"

      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: @user.id })

      post api_v0_deck_add_card_path(@deck.id), params: { list: 'main_board', card: @card }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'main_board', card: @card2 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'side_board', card: @card3 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'maybe_board', card: @card4 }
    end
    it 'returns a deck as JSON' do
      get api_v0_deck_path(@deck.id)
require 'pry'; binding.pry
      returned_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(returned_response[:cards][:main_board].count).to eq(2)
      expect(returned_response[:cards][:side_board].count).to eq(1)
      expect(returned_response[:cards][:maybe_board].count).to eq(1)
      expect(returned_response[:name]).to eq(@deck.name)
      expect(returned_response[:cards][:main_board].first.first[:name]).to eq(@card)
      expect(returned_response[:cards][:main_board].last.first[:name]).to eq(@card2)  
    end

    it 'returns an error if deck is not found' do
      get api_v0_deck_path(123)
      expect(response).to have_http_status(:not_found)
      expect(response.content_type).to include('application/json')
      expect(response.body).to eq({ error: 'Deck not found' }.to_json)
    end
  end
end