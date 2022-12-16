require 'rails_helper'

RSpec.describe Cat, type: :model do

    it "should validate presence of name" do
      cat = Cat.create
      expect(cat.errors[:name]).to_not be_empty

      
    end
    it "should validate presence of age" do
        cat = Cat.create 
        expect(cat.errors[:age]).to_not be_empty
    end

    ### Presence of enjoys attribute

    it "should validate presence of enjoys" do
        cat = Cat.create
        expect(cat.errors[:enjoys]).to_not be_empty
    end

    ### Length of enjoys attribute

    it "should validate the length of enjoys attribute" do
        cat = Cat.create name: "Joe", age: 5, image: "https://google.com", enjoys: "Long Walk"

        expect(cat.errors[:enjoys].first).to eq("is too short (minimum is 10 characters)")
        expect(cat.errors[:enjoys]).to_not be_empty
    end

    ### Presence of image attribute

    it "should validate presence of image" do
        cat = Cat.create
        expect(cat.errors[:image]).to_not be_empty
    end

  end   ### End describe cat do block