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
      expect(collection.id).to eq(1)
      expect(collection.code).to eq("10E")
      expect(collection.name).to eq("Tenth Edition")
      expect(collection.type).to eq("core")
      expect(collection.release_date).to eq("2007-07-13")
      expect(collection.block).to eq("Core Set")
    end
  end
end