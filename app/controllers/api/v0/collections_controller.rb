class Api::V0::CollectionsController < ApplicationController
  def index
    facade = CollectionFacade.new
    collections = facade.receive_collections
    render json: CollectionSerializer.new(collections)
  end

  def show
    collection_id = params[:id]
    facade = CollectionFacade.new

    collection_details = facade.receive_collection_details(collection_id)

    collection_codes = facade.filter_codes
  
    if collection_codes.include?(params[:id])
    render json: CollectionSerializer.new(collection_details)
    else
      render json: { error: "Collection not found" }, status: :not_found
    end
  end
end
  #   cards = facade.receive_collection_cards(collection_id)

  # end