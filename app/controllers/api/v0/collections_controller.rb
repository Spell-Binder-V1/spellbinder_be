class Api::V0::CollectionsController < ApplicationController
  def index

    facade = CollectionFacade.new
    collections = facade.receive_collections
    render json: CollectionSerializer.new(collections)
  end
end