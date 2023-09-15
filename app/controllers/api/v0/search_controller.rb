class Api::V0::SearchController < ApplicationController
  def search
    card = params[:q]
    facade = CardFacade.new
    card = facade.receive_card_search(card)
    if card.is_a?(Array) && !card.empty?
      render json: CardSerializer.new(card)
    elsif card.present? ? card.is_a?(Error) : card.empty?
      render json: ErrorSerializer.serialize(card), status: :not_found
    end
  end
end
