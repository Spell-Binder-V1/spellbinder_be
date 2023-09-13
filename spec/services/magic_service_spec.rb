require "rails_helper"

RSpec.describe "MagicService" do
  describe "#class methods" do
    describe "#get_collections" do
      it "can get all collections" do
        
        collection = MagicService.get_collections

        expect(collection).to be_an(Hash)
        expect(collection.first).to be_a(Array)
        expect(collection[:sets].first).to have_key(:name)
        expect(collection[:sets].first).to have_key(:code)
        expect(collection[:sets].first).to have_key(:type)
        expect(collection[:sets].first).to have_key(:releaseDate)
        expect(collection[:sets].first).to have_key(:block)
      end
    end
  end
end