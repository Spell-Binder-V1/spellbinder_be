require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  it "shows deckcard relationships and validations" do
    should belong_to(:deck)
    should belong_to(:card)

    should validate_presence_of(:deck_id)
    should validate_presence_of(:card_id)
  end
end
