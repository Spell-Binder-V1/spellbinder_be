require "rails_helper"

RSpec.describe UserSerializer, type: :serializer do
  it "serializes the expected attributes" do
    user = UserPoro.new({ id: 1,
                        username: "user",
                        email: "user@user.com"
          })
    serializer = UserSerializer.new(user).to_json
    results = JSON.parse(serializer, symbolize_names: true)

    expect(results[:data]).to have_key(:id)
    expect(results[:data][:id]).to be_a(String)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:type]).to be_a(String)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to be_a(Hash)
    expect(results[:data][:attributes]).to have_key(:username)
    expect(results[:data][:attributes][:username]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:email)
    expect(results[:data][:attributes][:email]).to be_a(String)
  end
end