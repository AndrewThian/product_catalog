require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Creation" do
    before do
      @category = FactoryGirl.create(:category)
    end
    it "can be created" do
      expect(@category).to be_valid
    end

    it "cannot be created without a name" do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it "cannot create similar name" do
      @category2 = FactoryGirl.create(:category)
      @category2.name = @category.name
      expect(@category2).to_not be_valid
    end
  end
end
