require 'rails_helper'

RSpec.describe Deck, type: :model do
  it "shows decks relationships and validations" do
    should belong_to(:user)

    should validate_presence_of(:name)
    should validate_presence_of(:user_id)
  end
end
