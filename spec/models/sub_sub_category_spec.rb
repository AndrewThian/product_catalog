require 'rails_helper'

RSpec.describe SubSubCategory, type: :model do
  describe "Creation" do
    before do
      @category = Category.create(name: 'Test category')
      @sub_category = SubCategory.create(name: 'Test sub cat', category_id: @category.id)
      @sub_sub_category = SubSubCategory.create(name: 'Test sub sub cat', sub_category_id: @sub_category.id)
    end
    it "can be created" do
      expect(@sub_sub_category).to be_valid
    end

    it "cannot be created without a name" do
      @sub_sub_category.name = nil
      expect(@sub_sub_category).to_not be_valid
    end

    it "cannot create more than one similar category" do
      @sub_sub_category2 = SubSubCategory.create(name: 'Test sub sub cat', sub_category_id: @sub_category.id)
      expect(@sub_sub_category2).to_not be_valid
    end
  end
end
