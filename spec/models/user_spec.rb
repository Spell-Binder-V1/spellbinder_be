require 'rails_helper'

RSpec.describe User, type: :model do
  it "shows user relationships and validations", :vcr do
    should have_many(:decks)

    should validate_presence_of(:username)
    should validate_uniqueness_of(:username)
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
  end

  it "user decks", :vcr do
    user = User.create!(email: "j@gmail.com", username: "josh", id: 1)
    deck = Deck.create!(name: "deck test", user_id: 1, id: 1)

    expect(User.user_decks(1)).to be_a(ActiveRecord::Relation)
  end

  it "user show deck", :vcr do
    user = User.create!(email: "j@gmail.com", username: "josh", id: 1)
    deck = Deck.create!(name: "deck test", user_id: 1, id: 1)

    expect(user.user_show_deck(1, 1)).to be_a(ActiveRecord::Relation)
  end
end
