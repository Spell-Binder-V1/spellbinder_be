require "rails_helper"

RSpec.describe "Collections Facade" do
  describe "#receive_collections" do
    it "receives collections" do
      collection_facade = CollectionFacade.new
      collections = collection_facade.receive_collections

      collections.each do |collection|
        expect(collection).to be_a(Collection)
      end

      expect(collections).to be_an(Array)
      expect(collections.count).to eq(500)

    end
  end
end