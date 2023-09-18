require 'rails_helper'

RSpec.describe 'decks update' do
  describe '#update' do
    it "updates the name of a specified deck" do
      user = User.create!(username: 'Buff MagicKarp', email: 'level@gang', password: 'password')
      deck = user.decks.create!(name: 'dreams')

      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

      new_name = "Punch Dreams"

      put api_v0_deck_path(deck), params: { deck: { name: new_name } }

      expect(response).to have_http_status(:ok)
      expect(deck.reload.name).to eq(new_name)
    end
  end

  describe "sad path" do
    it 'returns an error if deck is not found' do
      user = User.create!(username: 'Buff MagicKarp', email: 'level@gang', password: 'password')
      deck = user.decks.create!(name: 'dreams')

      put api_v0_deck_path(123), params: { deck: { name: "Punch Dreams" } }

      expect(response).to have_http_status(302)
      expect(deck.reload.name).to eq('dreams')
    end
  end
end