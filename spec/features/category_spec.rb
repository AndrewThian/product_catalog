require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit categories_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of categories' do
      expect(page).to have_content(/Categories/)
    end

    it 'has a list of categories' do
      # build stubbed creates a shallow instance of the object but doesn't query the database!
      category1 = FactoryGirl.create(:category)
      category2 = FactoryGirl.create(:category)

      visit categories_path
      expect(page).to have_content(/category/)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @category = FactoryGirl.create(:category)
      visit categories_path

      click_link("delete_cat_#{@category.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'create' do
    before do
      visit new_category_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'category[name]', with: 'Test cat'
      click_on 'Save'

      expect(page).to have_content('Test cat')
    end
  end

  describe 'edit' do
    before do
      @category = FactoryGirl.create(:category)
    end

    it 'can be reached by clicking on edit on index page' do
      visit categories_path

      click_link("edit_#{@category.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_category_path(@category)

      fill_in 'category[name]', with: 'Edited test cat'
      click_on 'Save'

      expect(page).to have_content('Edited test cat')
    end
  end
end
