require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit sub_categories_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of sub categories' do
      expect(page).to have_content(/Sub Categories/)
    end

    it 'has a list of sub categories' do
      category1 = FactoryGirl.create(:sub_category)
      category2 = FactoryGirl.create(:sub_category)

      visit sub_categories_path
      expect(page).to have_content(/Test sub cat/)
    end
  end

  describe 'create' do
    before do
      visit new_sub_category_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of new categories' do
      expect(page).to have_content(/New/)
    end

    it 'can be created from new form page' do
    end
  end
end
