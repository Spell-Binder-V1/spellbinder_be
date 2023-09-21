require "rails_helper"

RSpec.describe "Collection Code PORO" do
  describe "#collection_code" do
    it "has attributes" do
      collection_code = CollectionCode.new({  code: "10E" }, 1)

      expect(collection_code).to be_a(CollectionCode)
      expect(collection_code.id).to be_a(Integer)
      expect(collection_code.code).to be_a(String)
    end
  end
end