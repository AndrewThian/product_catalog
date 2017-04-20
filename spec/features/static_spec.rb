require 'rails_helper'

describe 'navigate' do
  before do
    visit root_path
  end
  describe 'homepage' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
  end
end
