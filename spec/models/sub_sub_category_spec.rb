require 'rails_helper'

RSpec.describe SubSubCategory, type: :model do
  describe "Creation" do
    before do
      @sub_sub_category = FactoryGirl.create(:sub_sub_category)
    end
    it "can be created" do
      expect(@sub_sub_category).to be_valid
    end

    it "cannot be created without a name" do
      @sub_sub_category.name = nil
      expect(@sub_sub_category).to_not be_valid
    end

    it "cannot create more than one similar sub sub category" do
      @sub_sub_category2 = FactoryGirl.create(:sub_sub_category)
      @sub_sub_category2.name = @sub_sub_category.name
      expect(@sub_sub_category2).to_not be_valid
    end
  end
end
