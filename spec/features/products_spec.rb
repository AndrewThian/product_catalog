require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit products_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of products' do
      expect(page).to have_content(/Products/)
    end

    it 'has a list of products' do
      category1 = FactoryGirl.create(:product)
      category2 = FactoryGirl.create(:product)

      visit products_path
      expect(page).to have_content(/Test/)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @product = FactoryGirl.create(:product)
      visit products_path

      click_link("delete_prod_#{@product.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'new' do
    before do
      visit products_path
      click_link('new_prod_from_cat_index')
    end

    it 'should send me to new form from index' do
      expect(page.status_code).to eq(200)
    end

    it 'should be a form for create' do
      expect(page).to have_content(/New/)
    end
  end

  describe 'create' do
    before do
      visit new_product_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of new product' do
      expect(page).to have_content(/New/)
    end

    # do testing for collection_select form in create action
  end

  describe 'edit' do
    before do
      @product = FactoryGirl.create(:product)
    end

    it 'can be reached by clicking on edit on index page' do
      visit products_path

      click_link("edit_prod_#{@product.id}")
      expect(page.status_code).to eq(200)
    end

    # do testing for collection_select form in edit action
  end
end
