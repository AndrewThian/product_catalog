require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  describe "Creation" do
    before do
      @sub_category = FactoryGirl.create(:sub_category)
    end
    it "can be created" do
      expect(@sub_category).to be_valid
    end

    it "cannot be created without a name" do
      @sub_category.name = nil
      expect(@sub_category).to_not be_valid
    end

    it "cannot create more than one similar category" do
      @sub_category2 = FactoryGirl.create(:sub_category)
      @sub_category2.name = @sub_category.name
      expect(@sub_category2).to_not be_valid
    end
  end
end
