require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit sub_sub_categories_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of sub sub categories' do
      expect(page).to have_content(/Sub Sub Categories/)
    end

    it 'has a list of sub sub categories' do
      category1 = FactoryGirl.create(:sub_sub_category)
      category2 = FactoryGirl.create(:sub_sub_category)

      visit sub_sub_categories_path
      expect(page).to have_content(/Test sub sub cat/)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @sub_sub_category = FactoryGirl.create(:sub_sub_category)
      visit sub_sub_categories_path

      click_link("delete_sub_sub_cat_#{@sub_sub_category.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'create' do
    before do
      visit new_sub_sub_category_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of new categories' do
      expect(page).to have_content(/New/)
    end

    # do testing for collection_select form in create action
  end

  describe 'edit' do
    before do
      @sub_sub_category = FactoryGirl.create(:sub_sub_category)
    end

    it 'can be reached by clicking on edit on index page' do
      visit sub_sub_categories_path

      click_link("edit_sub_sub_cat_#{@sub_sub_category.id}")
      expect(page.status_code).to eq(200)
    end

    # do testing for collection_select form in edit action
  end
end
