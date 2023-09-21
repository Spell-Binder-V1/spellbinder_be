require "rails_helper"

RSpec.describe "User Facade" do
  it "receives user information" do
    user_facade = UserFacade.new.recieve_user_data({email: "test@test.com", id: 1, username: "test_name"})

    expect(user_facade).to be_a(UserPoro)
    expect(user_facade.email).to be_a(String)
    expect(user_facade.id).to be_a(Integer)
    expect(user_facade.username).to be_a(String)
  end
end