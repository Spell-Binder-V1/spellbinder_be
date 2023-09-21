require "rails_helper"

RSpec.describe "Collection PORO" do
  describe "#collection" do
    it "has attributes" do
      collection = Collection.new({
                                    code: "10E",
                                    name: "Tenth Edition",
                                    type: "core",
                                    releaseDate: "2007-07-13",
                                    block: "Core Set"
                                  }, 1)


      expect(collection).to be_a(Collection)
      expect(collection.id).to be_a(Integer)
      expect(collection.code).to be_a(String)
      expect(collection.name).to be_a(String)
      expect(collection.type).to be_a(String)
      expect(collection.release_date).to be_a(String)
      expect(collection.block).to be_a(String)
      expect(collection.cards).to be_a(Array)
    end
  end
end