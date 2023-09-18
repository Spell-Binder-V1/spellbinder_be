class AddCardsToDecks < ActiveRecord::Migration[7.0]
  def change
    add_column :decks, :cards, :json, default: { main_board: [], side_board: [], maybe_board: [] }
  end
end
