require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "shows card relationships and validations" do
    it { should have_many(:deck_cards) }
    it { should have_many(:decks).through(:deck_cards) }

    it {should validate_presence_of(:name) }
    it {should validate_presence_of(:set_name) }
    it {should validate_presence_of(:multiverseid) }
    it { should validate_presence_of(:mana_cost) }
    it {should validate_presence_of(:converted_mana_cost) }
    it {should validate_presence_of(:type) }
    it {should validate_presence_of(:rarity) }
    it {should validate_presence_of(:set) }
    it {should validate_presence_of(:text) }
    it {should validate_presence_of(:artist) }
    it {should validate_presence_of(:number) }
    it {should validate_presence_of(:power) }
    it {should validate_presence_of(:toughness) }
    it {should validate_presence_of(:image_url) }
  end

  it "should validate the colors of an array" do
    test = Card.new(colors: "not_an_array")
    (test.valid?).should == false
    
  end

  it "should validate colors it is an array" do
    test = Card.new(colors: ["red", "green", "blue"])
    test.valid?
  end

  it "should validate the colors identity of an array" do
    test = Card.new(color_identity: "not_an_array")
    (test.valid?).should == false
    
  end

  it "should validate color identity is an array" do
    test = Card.new(color_identity: ["red", "green", "blue"])
    test.valid?
  end

  it "should validate the types of an array" do
    test = Card.new(types: "not_an_array")
    (test.valid?).should == false
    
  end

  it "should validate types is an array" do
    test = Card.new(types: ["Legendary", "Creature"])
    test.valid?
  end

  it "should validate the subtypes of an array" do
    test = Card.new(subtypes: "not_an_array")
    (test.valid?).should == false
    
  end

  it "should validate subtypes is an array" do
    test = Card.new(subtypes: ["red", "green", "blue"])
    test.valid?
  end

  it "should validate the rulings of an array" do
    test = Card.new(rulings: "not_an_array")
    (test.valid?).should == false
    
  end

  it "should validate rulings is an array" do
    test = Card.new(rulings: ["date:", "text:"])
    #rulings contains a hash with string values
    test.valid?
  end
end

