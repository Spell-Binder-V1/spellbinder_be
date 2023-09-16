require 'rails_helper'

RSpec.describe User, type: :model do
  it "shows user relationships and validations" do
    should have_many(:decks)
    # should have_secure_password

    should validate_presence_of(:username)
    should validate_uniqueness_of(:username)
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
    should validate_presence_of(:password)
  end
end
