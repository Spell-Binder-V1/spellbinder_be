require "rails_helper"

RSpec.describe "Error PORO" do
  describe "#error" do
    it "has attributes" do
      error = Error.new({ status: 404, error: "Not Found" })

      expect(error).to be_a(Error)
      expect(error.status).to be_a(Integer)
      expect(error.error).to be_a(String)
    end
  end
end