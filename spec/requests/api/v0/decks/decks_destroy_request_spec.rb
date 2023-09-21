require 'rails_helper'

RSpec.describe "DELETE deck", type: :request do
  describe "when the user is authenticated" do
    it "deletes the specified deck", :vcr do
      user = User.create!(username: 'Buff MagicKarp', email: 'level@gang')
      deck = user.decks.create!(name: 'dreams')
      allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

      expect {
        delete api_v0_deck_path(deck)
      }.to change(Deck, :count).by(-1)

      expect(response).to have_http_status(:no_content)
      expect(response.status).to eq(204)
    end
  end

  describe "when the user is not authenticated" do
    it "returns a 401 Unauthorized status code", :vcr do
      user = User.create!(username: 'Buff MagicKarp', email: 'level@gang')
      deck = user.decks.create!(name: 'dreams')
      # ! had to create user so a deck could be created but user is not logged in
      expect {
        delete api_v0_deck_path(deck)
      }.not_to change(Deck, :count)

      expect(response).to have_http_status(302)
    end
  end
end