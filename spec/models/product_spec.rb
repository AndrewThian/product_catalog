require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Creation" do
    before do
      @category = Category.create(name: 'Test category')
      @sub_category = SubCategory.create(name: 'Test sub cat', category_id: @category.id)
      @sub_sub_category = SubSubCategory.create(name: 'Test sub sub cat', sub_category_id: @sub_category.id)
      @product = Product.create(name: 'Test prod', sub_sub_category_id: @sub_sub_category.id)
    end
    it "can be created" do
      expect(@product).to be_valid
    end

    it "cannot be created without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "cannot create more than one similar category" do
      @product2 = Product.create(name: 'Test prod', sub_sub_category_id: @sub_sub_category.id)
      expect(@product2).to_not be_valid
    end
  end
end
