class Api::V0::DecksController < ApplicationController
  before_action :authenticate_user
  def index
    facade = DeckFacade.new
    decks = facade.receive_decks
    render json: DeckSerializer.new(decks)
  end

  def show
    deck_id = params[:id]
    facade = DeckFacade.new
    deck = facade.receive_deck_show(deck_id)
    if deck.is_a?(Error)
      render json: ErrorSerializer.serialize(deck), status: :not_found
    else
      render json: DeckSerializer.new(deck)
    end
  end
end