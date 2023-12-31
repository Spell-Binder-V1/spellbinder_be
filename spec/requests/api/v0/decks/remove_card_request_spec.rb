require 'rails_helper'

RSpec.describe "remove card from deck" do 
  before :each do 
    @user = User.create!(username: 'Buff MagicKarp', email: 'level@gang')
    @deck = @user.decks.create!(name: 'dreams')
    @card = "Black Lotus"
    @card2 = "The One Ring"
    @card3 = "Mox Sapphire"
    @card4 = "Mox Ruby"
    # @encoded_card_name = URI.encode_www_form_component(@card_name)
  end

  describe "POST /api/v0/decks/:id/remove_card" do
    it 'removes a card from a deck' do
      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: @user.id })
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'main_board', card: @card }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'main_board', card: @card2 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'side_board', card: @card3 }
      post api_v0_deck_add_card_path(@deck.id), params: { list: 'maybe_board', card: @card4 }

      returned_card = JSON.parse(response.body, symbolize_names: true)

      expect(returned_card[:cards][:main_board].count).to eq(2)

      post api_v0_deck_remove_card_path(@deck.id), params: { list: 'main_board', card: @card}
      returned_card = JSON.parse(response.body, symbolize_names: true)
  
      expect(returned_card[:cards][:main_board].count).to eq(1)

      post api_v0_deck_remove_card_path(@deck.id), params: { list: 'main_board', card: @card }

      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)).to eq({ "error" => "Deck/card/list not found" })

      post api_v0_deck_remove_card_path(@deck.id), params: { list: 'ghost faced magikarpXD', card: @card3 }

      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)).to eq({ "error" => "Deck/card/list not found" })
      
      post api_v0_deck_remove_card_path(@deck.id), params: { list: 'side_board', card: @card3 }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body, symbolize_names: true)[:cards][:side_board].count).to eq(0)

      post api_v0_deck_remove_card_path(@deck.id), params: { list: 'maybe_board', card: @card4 }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body, symbolize_names: true)[:cards][:maybe_board].count).to eq(0)
    end
  end
end