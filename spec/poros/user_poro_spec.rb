require "rails_helper"

RSpec.describe "User PORO" do
  describe "#user" do
    it "has attributes" do
      user = User.new({ id: 1,
                        username: "user",
                        email: "user@user.com"
          })

      expect(user).to be_a(User)
      expect(user.id).to be_a(Integer)
      expect(user.username).to be_a(String)
      expect(user.email).to be_a(String)
    end
  end
end