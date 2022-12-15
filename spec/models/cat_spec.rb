require 'rails_helper'

RSpec.describe Cat, type: :model do
    it "should validate presense of name" do
      cat = Cat.create
      expect(cat.errors[:name]).to_not be_empty

      
    end
    it "should validate presense of age" do
        cat = Cat.create 
        expect(cat.errors[:age]).to_not be_empty
    end

    it "should validate presense of enjoys" do
        cat = Cat.create
        expect(cat.errors[:enjoys]).to_not be_empty
    end

    it "should validate presense of image" do
        cat = Cat.create
        expect(cat.errors[:image]).to_not be_empty
    end
  end