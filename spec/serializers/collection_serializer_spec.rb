require "rails_helper"

RSpec.describe CollectionSerializer, type: :serializer do
  it "serializes the expected attributes" do
    collection = Collection.new({
                                    code: "10E",
                                    name: "Tenth Edition",
                                    type: "core",
                                    releaseDate: "2007-07-13",
                                    block: "Core Set"
                                  }, 1)
    serializer = CollectionSerializer.new(collection).to_json
    results = JSON.parse(serializer, symbolize_names: true)

    expect(results[:data]).to have_key(:id)
    expect(results[:data][:id]).to be_a(String)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:type]).to be_a(String)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to be_a(Hash)
    expect(results[:data][:attributes]).to have_key(:code)
    expect(results[:data][:attributes][:code]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:name)
    expect(results[:data][:attributes][:name]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:type)
    expect(results[:data][:attributes][:type]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:release_date)
    expect(results[:data][:attributes][:release_date]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:block)
    expect(results[:data][:attributes][:block]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:cards)
    expect(results[:data][:attributes][:cards]).to be_a(Array)
  end
end