require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Creation" do
    before do
      @product = FactoryGirl.create(:product)
    end
    it "can be created" do
      expect(@product).to be_valid
    end

    it "cannot be created without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "cannot be created without a price" do
      @product.price = nil
      expect(@product).to_not be_valid
    end

    it "cannot be created with a price less than 0" do
      @product.price = -5
      expect(@product).to_not be_valid
    end

    it "cannot create more than one similar category" do
      @product2 = FactoryGirl.create(:product)
      @product2.name = @product.name
      expect(@product2).to_not be_valid
    end
  end
end
