class Api::V0::SearchController < ApplicationController
  def search
    card = params[:q]
    facade = CardFacade.new
    card = facade.receive_card_search(card)
    if card.is_a?(Array) && !card.empty?
      render json: CardSerializer.new(card)
    elsif card.is_a?(Array) && card.empty?
      render json: {error: "No cards found"}, status: :not_found
    end
  end
end
