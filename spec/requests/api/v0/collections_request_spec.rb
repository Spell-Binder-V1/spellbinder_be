require "rails_helper"

RSpec.describe "CollectionsController" do
  describe "#index" do
    it "returns collections" do
      get "/api/v0/collections"
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
    end
  end
end