require "rails_helper"

RSpec.describe "Deck Index Endpoint" do
  describe "GET /api/v0/decks" do
    before :each do
      user1 = User.create!(username: "goku", email: "goku@gmail.com", password: "password")
      user2 = User.create!(username: "vegeta", email: "vegeta@gmail.com", password: "password")
      deck1 = Deck.create!(name: "Goku's Deck", user_id: user1.id)
      deck2 = Deck.create!(name: "Vegeta's Deck", user_id: user2.id)
      visit "/api/v0/decks"
    end
    it 
  end
end