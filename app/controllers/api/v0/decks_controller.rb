class API::V0::DecksController < ApplicationController
  include SessionHelper
  def index
    facade = DeckFacade.new
    decks = facade.receive_decks
    render json: DeckSerializer.new(decks)
  end
end